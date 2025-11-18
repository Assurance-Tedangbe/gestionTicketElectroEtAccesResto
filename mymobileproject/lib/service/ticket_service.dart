// lib/services/ticket_api_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymobileproject/model/ticket_model.dart';

/* 
  - Service combiné qui gère :
  - Appels HTTP vers l'API Spring Boot pour les tickets
  - Cache simple des données
  - Logique métier légère
  - Transformation des données 
*/
class TicketApiService {
  /* Use the IP address of the Android emulator (10.0.2.2)
  or your machine's IP address for other emulators/devices. */
  static const String baseUrl = 'http://10.0.2.2:8080/api/tickets';

  // Configure HTTP headers for all requests
  static final Map<String, String> headers = {
    'Content-Type': 'application/json', // Indique au serveur "J'envoie du JSON"
    'Accept':
        'application/json', // Indique au serveur "Je veux recevoir du JSON"
  };

  // === CACHE SIMPLE INTÉGRÉ ===
  List<Ticket> _cachedTickets = []; // Cache des tickets
  DateTime? _lastFetchTime; // Dernière récupération
  static const Duration cacheDuration = Duration(minutes: 5); // Durée de cache

  // -------------------------
  // 1. CREATE TICKETS (POST /api/tickets)
  // -------------------------
  Future<List<Ticket>> createTickets(CreationTicketsRequestDTO request) async {
    // "Je vais créer des tickets via POST /api/tickets et retourner les tickets créés"
    try {
      print(
          "Création de nouveaux tickets: ${request.ticketType} x ${request.quantity}");

      final response = await http.post(
        // "J'envoie une requête POST :"
        Uri.parse(baseUrl), // Convertit l'URL string en objet Uri
        headers: headers, // Utilise les headers configurés
        body:
            json.encode(request.toJson()), // Convertit la requête → JSON string
      );

      if (response.statusCode == 201) {
        final List<dynamic> jsonList = json.decode(response.body);
        final newTickets = jsonList
            .map((json) => Ticket.fromJson(json))
            .toList(); // "Convertit la réponse JSON → liste d'objets Ticket"

        print("Tickets créés avec IDs: ${newTickets.map((t) => t.ticketId)}");

        // Mise à jour du cache
        _cachedTickets.addAll(newTickets);

        return newTickets;
      } else {
        throw Exception('Erreur création tickets: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur création tickets: $e");
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 2. READ ALL TICKETS (GET /api/tickets)
  // -------------------------
  // Utilise le cache pour éviter les appels API inutiles
  Future<List<Ticket>> getAllTickets({bool forceRefresh = false}) async {
    // "Vérifie si le cache est encore valide"
    final now = DateTime.now();

    final cacheValide = _lastFetchTime != null &&
        now.difference(_lastFetchTime!) < cacheDuration;

    // "Retourne le cache si valide et pas de force refresh"
    if (!forceRefresh && cacheValide && _cachedTickets.isNotEmpty) {
      print("Retourne ${_cachedTickets.length} tickets depuis le cache");

      return _cachedTickets;
    }

    try {
      print("Récupération des tickets depuis l'API");

      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // "Convertit la réponse JSON → liste d'objets Ticket"

        final List<dynamic> jsonList =
            json.decode(response.body); // "JSON string → Liste d'objets Dart"

        _cachedTickets = jsonList
            .map((json) => Ticket.fromJson(json))
            .toList(); // "Transforme chaque objet JSON → objet Ticket"

        _lastFetchTime = DateTime.now(); // "Mise à jour du timestamp"

        print("${_cachedTickets.length} tickets récupérés");

        return _cachedTickets;
      } else {
        throw Exception('Erreur récupération tickets: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur récupération tickets: $e");

      // Fallback: retourne le cache même expiré si pas de réseau
      if (_cachedTickets.isNotEmpty) {
        print("Retourne cache expiré en fallback");
        return _cachedTickets;
      }

      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 3. READ TICKET BY ID (GET /api/tickets/{ticketId})
  // -------------------------
  Future<Ticket> getTicketById(String ticketId) async {
    try {
      print("Récupération du ticket ID: $ticketId");

      // "D'abord, recherche dans le cache"
      final cachedTicket = _cachedTickets.firstWhere(
        (ticket) => ticket.ticketId == ticketId,
        orElse: () => Ticket(
          ticketId: '', // "Marqueur 'non trouvé'"
          ticketType: '',
          ticketPrice: 0.0,
          paymentCode: '',
          booked: false,
          ticketStatus: '',
          ticketCreationDate: DateTime.now(),
          ticketDescription: '',
          menuDTO: MenuDTO(menuId: '', menuName: ''),
          userDTO: UserDTO(userId: '', firstName: '', lastName: ''),
          accountDTO: AccountDTO(accountId: '', accountNumber: ''),
        ),
      );

      if (cachedTicket.ticketId.isNotEmpty) {
        print("Ticket trouvé dans le cache");
        return cachedTicket;
      }

      // "Si pas dans le cache, appel API"
      final response = await http.get(
        Uri.parse('$baseUrl/$ticketId'),
        headers: headers,
      ); // "GET /api/tickets/{ticketId} pour récupérer un ticket spécifique"

      if (response.statusCode == 200) {
        final ticket = Ticket.fromJson(json.decode(response.body));

        print("Ticket récupéré: ${ticket.ticketId}");

        return ticket;
      } else if (response.statusCode == 404) {
        throw Exception('Ticket non trouvé');
      } else {
        throw Exception('Erreur récupération ticket: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur récupération par ID: $e");

      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 4. UPDATE TICKET (PUT /api/tickets/{ticketId})
  // -------------------------
  Future<Ticket> updateTicket(Ticket ticket) async {
    try {
      print("Mise à jour du ticket ID: ${ticket.ticketId}");

      final response = await http.put(
        Uri.parse('$baseUrl/${ticket.ticketId}'),
        headers: headers,
        body: json.encode(ticket.toJson()), // "Envoie les nouvelles données"
      ); // "PUT /api/tickets/{ticketId} pour modifier un ticket existant"

      if (response.statusCode == 200) {
        final updatedTicket = Ticket.fromJson(json.decode(response.body));
        print("Ticket mis à jour: ${updatedTicket.ticketId}");

        // "Met à jour le cache"
        final index =
            _cachedTickets.indexWhere((t) => t.ticketId == ticket.ticketId);
        if (index != -1) {
          _cachedTickets[index] = updatedTicket;
        }

        return updatedTicket;
      } else {
        throw Exception('Erreur mise à jour ticket: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur mise à jour ticket: $e");
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 5. DELETE TICKET (DELETE /api/tickets/{ticketId})
  // -------------------------
  Future<void> deleteTicket(String ticketId) async {
    try {
      print("Suppression du ticket ID: $ticketId");

      final response = await http.delete(
        Uri.parse('$baseUrl/$ticketId'),
        headers: headers,
      );

      if (response.statusCode == 204) {
        print("Ticket supprimé avec ID: $ticketId");

        // "Met à jour le cache"
        _cachedTickets.removeWhere((ticket) => ticket.ticketId == ticketId);
      } else {
        throw Exception('Erreur suppression ticket: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur suppression ticket: $e");

      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 6. UPDATE TICKET STATUS (PUT /api/tickets/ticketStatus/{ticketId})
  // sans cache
  // -------------------------
  Future<void> updateTicketStatus(String ticketId, String ticketStatus) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/ticketStatus/$ticketId'),
        headers: headers,
        body: json.encode(ticketStatus), // "Envoie seulement le nouveau statut"
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Erreur mise à jour statut ticket: ${response.statusCode}');
      }

      print("Statut du ticket $ticketId mis à jour: $ticketStatus");

      // "Met à jour le cache local"
      final index = _cachedTickets.indexWhere((t) => t.ticketId == ticketId);
      if (index != -1) {
        _cachedTickets[index] =
            _cachedTickets[index].copyWith(ticketStatus: ticketStatus);
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 7. BOOK TICKET (PUT /api/tickets/book/{ticketId})
  // -------------------------
  Future<void> bookTicket(String ticketId) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/book/$ticketId'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Erreur réservation ticket: ${response.statusCode}');
      }

      print("Ticket $ticketId réservé");

      // "Met à jour le cache local"
      final index = _cachedTickets.indexWhere((t) => t.ticketId == ticketId);
      if (index != -1) {
        _cachedTickets[index] = _cachedTickets[index].copyWith(booked: true);
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 8. UNBOOK TICKET (PUT /api/tickets/unbook/{ticketId})
  // -------------------------
  Future<void> unbookTicket(String ticketId) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/unbook/$ticketId'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Erreur annulation réservation ticket: ${response.statusCode}');
      }

      print("Réservation du ticket $ticketId annulée");

      // "Met à jour le cache local"
      final index = _cachedTickets.indexWhere((t) => t.ticketId == ticketId);
      if (index != -1) {
        _cachedTickets[index] = _cachedTickets[index].copyWith(booked: false);
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 9. READ TICKETS BY STATUS (GET /api/tickets/ticketStatus/{ticketStatus})
  // -------------------------
  Future<List<Ticket>> getTicketsByStatus(String ticketStatus) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/ticketStatus/$ticketStatus'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Ticket.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erreur récupération tickets par statut: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 10. READ TICKETS BY ACCOUNT ID (GET /api/tickets/accountId/{accountId})
  // -------------------------
  Future<List<Ticket>> getTicketsByAccountId(String accountId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/accountId/$accountId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Ticket.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erreur récupération tickets par compte: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 11. READ TICKETS BY USER ID (GET /api/tickets/userId/{userId})
  // -------------------------
  Future<List<Ticket>> getTicketsByUserId(String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/userId/$userId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Ticket.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erreur récupération tickets par utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 12. READ TICKETS BY MENU ID AND USER ID (GET /api/tickets/menuId/{menuId}/userId/{userId})
  // -------------------------
  Future<List<Ticket>> getTicketsByMenuIdAndUserId(
      String menuId, String userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/menuId/$menuId/userId/$userId'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Ticket.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erreur récupération tickets par menu et utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 13. READ TICKETS BY MENU ID, USER ID AND STATUS (GET /api/tickets/menuId/{menuId}/userId/{userId}/status/{ticketStatus})
  // -------------------------
  Future<List<Ticket>> getTicketsByMenuIdAndUserIdAndStatus(
      String menuId, String userId, String ticketStatus) async {
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl/menuId/$menuId/userId/$userId/status/$ticketStatus'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => Ticket.fromJson(json)).toList();
      } else {
        throw Exception(
            'Erreur récupération tickets par menu, utilisateur et statut: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 14. PURCHASE TICKETS (POST /api/tickets/{purchase})
  // -------------------------
  Future<List<Ticket>> purchaseTickets(
      PurchaseTicketsRequestDTO request) async {
    try {
      print("Achat de tickets pour le compte: ${request.accountDTO.accountId}");

      final response = await http.post(
        Uri.parse('$baseUrl/purchase'),
        headers: headers,
        body: json.encode(request.toJson()),
      );

      if (response.statusCode == 201) {
        final List<dynamic> jsonList = json.decode(response.body);
        final purchasedTickets =
            jsonList.map((json) => Ticket.fromJson(json)).toList();

        print("Tickets achetés: ${purchasedTickets.length}");

        // "Met à jour le cache"
        _cachedTickets.addAll(purchasedTickets);

        return purchasedTickets;
      } else {
        throw Exception('Erreur achat tickets: ${response.statusCode}');
      }
    } catch (e) {
      print("Erreur achat tickets: $e");
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 15. TRANSFER TICKETS (PUT /api/tickets/transferTickets)
  // sans cache
  // -------------------------
  Future<void> transferTickets(TransferTicketsRequestDTO request) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/transferTickets'),
        headers: headers,
        body: json.encode(request.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Erreur transfert tickets: ${response.statusCode}');
      }

      print(
          "Tickets transférés de ${request.fromUserId} vers ${request.toUserId}");
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 16. CANCEL TRANSFER TICKETS (PUT /api/tickets/cancelTransferTickets)
  // sans cache
  // -------------------------
  Future<void> cancelTransferTickets(
      CancelTransferTicketsRequestDTO request) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/cancelTransferTickets'),
        headers: headers,
        body: json.encode(request.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Erreur annulation transfert tickets: ${response.statusCode}');
      }

      print(
          "Transfert de tickets annulé entre ${request.fromUserId} et ${request.toUserId}");
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 17. DEBIT ACCOUNT (PUT /api/tickets/debitAccount)
  // sans cache
  // -------------------------
  Future<void> debitAccount(DebitAccountRequestDTO request) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/debitAccount'),
        headers: headers,
        body: json.encode(request.toJson()),
      );

      if (response.statusCode != 200) {
        throw Exception('Erreur débit compte: ${response.statusCode}');
      }

      print("Compte ${request.accountId} débité de ${request.amount}");
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // === MÉTHODES UTILITAIRES AVEC LOGIQUE MÉTIER LÉGÈRE ===

  // "Recherche de tickets dans le cache local"
  List<Ticket> searchTickets(String query) {
    if (query.isEmpty) return _cachedTickets;

    final queryLower = query.toLowerCase();

    return _cachedTickets
        .where((ticket) =>
            ticket.ticketId.toLowerCase().contains(queryLower) ||
            ticket.ticketType.toLowerCase().contains(queryLower) ||
            ticket.ticketStatus.toLowerCase().contains(queryLower) ||
            ticket.paymentCode.toLowerCase().contains(queryLower) ||
            ticket.userDTO.firstName.toLowerCase().contains(queryLower) ||
            ticket.userDTO.lastName.toLowerCase().contains(queryLower) ||
            ticket.menuDTO.menuName.toLowerCase().contains(queryLower))
        .toList();
  }

  // "Validation basique des données de ticket"
  void validateTicketData(Ticket ticket) {
    if (ticket.ticketType.isEmpty) {
      throw Exception('Le type de ticket est requis');
    }

    if (ticket.ticketPrice <= 0) {
      throw Exception('Le prix du ticket doit être positif');
    }

    if (ticket.ticketDescription.length < 3) {
      throw Exception('La description doit contenir au moins 3 caractères');
    }

    if (ticket.ticketDescription.length > 100) {
      throw Exception('La description ne peut pas dépasser 100 caractères');
    }
  }

  // "Vide le cache (utile pour forcer un rafraîchissement)"
  void clearCache() {
    _cachedTickets.clear();
    _lastFetchTime = null;
    print("Cache tickets vidé");
  }

  // "Filtre les tickets par statut"
  List<Ticket> filterTicketsByStatus(String status) {
    return _cachedTickets
        .where((ticket) =>
            ticket.ticketStatus.toLowerCase() == status.toLowerCase())
        .toList();
  }

  // "Filtre les tickets par type"
  List<Ticket> filterTicketsByType(String type) {
    return _cachedTickets
        .where(
            (ticket) => ticket.ticketType.toLowerCase() == type.toLowerCase())
        .toList();
  }

  // "Filtre les tickets réservés/non réservés"
  List<Ticket> filterTicketsByBookedStatus(bool booked) {
    return _cachedTickets.where((ticket) => ticket.booked == booked).toList();
  }

  // "Trie les tickets par prix"
  List<Ticket> sortTicketsByPrice(bool ascending) {
    final sortedTickets = List<Ticket>.from(_cachedTickets);
    sortedTickets.sort((a, b) => ascending
        ? a.ticketPrice.compareTo(b.ticketPrice)
        : b.ticketPrice.compareTo(a.ticketPrice));
    return sortedTickets;
  }

  // "Trie les tickets par date de création"
  List<Ticket> sortTicketsByCreationDate(bool ascending) {
    final sortedTickets = List<Ticket>.from(_cachedTickets);
    sortedTickets.sort((a, b) => ascending
        ? a.ticketCreationDate.compareTo(b.ticketCreationDate)
        : b.ticketCreationDate.compareTo(a.ticketCreationDate));
    return sortedTickets;
  }
}
