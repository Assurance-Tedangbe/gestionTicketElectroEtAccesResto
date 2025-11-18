// lib/providers/ticket_provider.dart

import 'package:flutter/foundation.dart'; // "Importe les bases de Flutter, dont ChangeNotifier"
import 'package:mymobileproject/model/ticket_model.dart';
import 'package:mymobileproject/service/ticket_service.dart';

/*
  Rôle Principal: Gestionnaire d'état centralisé pour les tickets
  Votre TicketProvider sert de cerveau central qui :
   - Stocke l'état de tous les tickets / gère l'état de l'interface utilisateur 
   - Coordonne les opérations CRUD / actions sur les tickets 
   - Gère le loading et les erreurs
   - Notifie l'UI des changements / notifie les changements aux écouteurs

  Gère l'état de toutes les opérations du TicketApiService
*/
class TicketProvider with ChangeNotifier {
  // "Crée une classe qui peut notifier ses écouteurs des changements"

  // "_" signifie que ces variables sont privées

  final TicketApiService _service;

  // === INTERNAL STATE FOR ALL OPERATIONS ===

  // "État principal"
  List<Ticket> _tickets = []; // "Liste vide pour stocker tous les tickets"
  Ticket? _currentTicket; // "Ticket actuellement sélectionné (peut être null)"
  bool _isLoading = false; // "Indicateur de chargement (initialement false)"
  String _error = ''; // "Stocke les messages d'erreur (initialement vide)"

  // "État pour les opérations spécifiques"
  bool _isCreatingTickets = false; // "Création en cours"
  bool _isUpdatingTicket = false; // "Mise à jour en cours"
  bool _isDeletingTicket = false; // "Suppression en cours"
  bool _isUpdatingTicketStatus = false; // "Mise à jour statut en cours"
  bool _isBookingTicket = false; // "Réservation en cours"
  bool _isUnbookingTicket = false; // "Annulation réservation en cours"
  bool _isPurchasingTickets = false; // "Achat en cours"
  bool _isTransferringTickets = false; // "Transfert en cours"
  bool _isCancelingTransfer = false; // "Annulation transfert en cours"
  bool _isDebitingAccount = false; // "Débit compte en cours"

  TicketProvider(this._service);

  // === GETTERS - Accès contrôlé à l'état ===

  // "Getters principaux"
  List<Ticket> get tickets =>
      _tickets; // "Permet à d'autres classes de lire `_tickets` mais pas de le modifier"
  Ticket? get currentTicket => _currentTicket;
  bool get isLoading => _isLoading;
  String get error => _error;

  // "Getters pour les états spécifiques"
  bool get isCreatingTickets => _isCreatingTickets;
  bool get isUpdatingTicket => _isUpdatingTicket;
  bool get isDeletingTicket => _isDeletingTicket;
  bool get isUpdatingTicketStatus => _isUpdatingTicketStatus;
  bool get isBookingTicket => _isBookingTicket;
  bool get isUnbookingTicket => _isUnbookingTicket;
  bool get isPurchasingTickets => _isPurchasingTickets;
  bool get isTransferringTickets => _isTransferringTickets;
  bool get isCancelingTransfer => _isCancelingTransfer;
  bool get isDebitingAccount => _isDebitingAccount;

  // === MÉTHODES D'ACTION - Gestion complète des états ===

  // "Charge tous les tickets depuis le service"
  Future<void> loadAllTickets({bool forceRefresh = false}) async {
    // "charge les tickets, cela va prendre du temps (async)"

    _isLoading = true; // "active le chargement"
    _error = ''; // "efface les erreurs précédentes"
    notifyListeners(); // "notifie l'UI du début du chargement"

    try {
      _tickets = await _service.getAllTickets(
          forceRefresh:
              forceRefresh); // "Demande au service de me donner tous les tickets"
      _error = ''; // "Confirme qu'il n'y a pas d'erreurs"
      print("Chargement réussi : ${_tickets.length} tickets");
    } catch (e) {
      _error = e.toString(); // "Stocke l'erreur"
      print("Erreur loadAllTickets: $e");
    } finally {
      _isLoading = false; // "arrête le chargement"
      notifyListeners(); // "notifie l'UI de la fin du chargement"
    }
  }

  // "Crée de nouveaux tickets"
  Future<bool> createNewTickets(CreationTicketsRequestDTO request) async {
    // "Je vais créer des tickets et je vous dirai si ça a fonctionné (bool)"
    _isCreatingTickets = true;
    _isLoading = true;
    notifyListeners(); // "démarre le travail et notifie l'interface"

    try {
      final newTickets = await _service.createTickets(
          request); // "demande au service de créer ces tickets dans l'API"
      _tickets.addAll(
          newTickets); // "Si ça fonctionne, ajoute les nouveaux tickets à ma liste locale"
      _error = ''; // "Efface les erreurs"
      print("Tickets créés avec succès: ${newTickets.length} tickets");
      return true; // "Succès"
    } catch (e) {
      _error = 'Erreur création tickets: ${e.toString()}';
      print("Erreur createNewTickets: $e");
      return false; // "Échec"
    } finally {
      _isCreatingTickets = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Met à jour un ticket existant"
  Future<bool> updateExistingTicket(Ticket ticket) async {
    _isUpdatingTicket = true;
    _isLoading = true;
    notifyListeners();

    try {
      _service.validateTicketData(ticket);

      final updatedTicket = await _service
          .updateTicket(ticket); // "demande à l'API de mettre à jour ce ticket"

      // "Met à jour dans la liste locale"
      final index = _tickets.indexWhere((t) =>
          t.ticketId ==
          ticket.ticketId); // "cherche la position de ce ticket dans ma liste"
      if (index != -1) {
        _tickets[index] =
            updatedTicket; // "Si j'ai trouvé le ticket (index != -1), je remplace l'ancienne version par la nouvelle"
      }

      _error = '';
      print("Ticket mis à jour avec succès: ${updatedTicket.ticketId}");
      return true;
    } catch (e) {
      _error = 'Erreur mise à jour ticket: ${e.toString()}';
      print("Erreur updateExistingTicket: $e");
      return false;
    } finally {
      _isUpdatingTicket = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Supprime un ticket"
  Future<bool> deleteExistingTicket(String ticketId) async {
    _isDeletingTicket = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.deleteTicket(
          ticketId); // "demande à l'API de supprimer le ticket avec cet ID"

      // "supprime le ticket de la liste locale"
      _tickets.removeWhere((ticket) => ticket.ticketId == ticketId);

      _error = '';
      print("Ticket avec cet ID supprimé: $ticketId");
      return true;
    } catch (e) {
      _error = 'Erreur suppression: ${e.toString()}';
      print("Erreur deleteExistingTicket: $e");
      return false;
    } finally {
      _isDeletingTicket = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  /* Charge un ticket spécifique par son ID
     Cette méthode retourne void car le résultat est stocké dans _currentTicket */
  Future<void> loadTicketById(String ticketId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _currentTicket = await _service.getTicketById(
          ticketId); // "demande un ticket spécifique par son id à l'API et le stocke dans _currentTicket"
      _error = '';
      print("Ticket chargé par ID: $ticketId");
    } catch (e) {
      _error = 'Erreur chargement ticket: ${e.toString()}';
      print("Erreur loadTicketById: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Met à jour le statut d'un ticket"
  Future<bool> updateTicketStatus(String ticketId, String ticketStatus) async {
    _isUpdatingTicketStatus = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.updateTicketStatus(ticketId,
          ticketStatus); // "demande à l'API de mettre à jour le statut du ticket"

      _error = '';
      print("Statut du ticket $ticketId mis à jour: $ticketStatus");
      return true;
    } catch (e) {
      _error = 'Erreur mise à jour statut ticket: ${e.toString()}';
      print("Erreur updateTicketStatus: $e");
      return false;
    } finally {
      _isUpdatingTicketStatus = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Réserve un ticket"
  Future<bool> bookTicket(String ticketId) async {
    _isBookingTicket = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service
          .bookTicket(ticketId); // "demande à l'API de réserver le ticket"

      _error = '';
      print("Ticket $ticketId réservé");
      return true;
    } catch (e) {
      _error = 'Erreur réservation ticket: ${e.toString()}';
      print("Erreur bookTicket: $e");
      return false;
    } finally {
      _isBookingTicket = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Annule la réservation d'un ticket"
  Future<bool> unbookTicket(String ticketId) async {
    _isUnbookingTicket = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.unbookTicket(
          ticketId); // "demande à l'API d'annuler la réservation du ticket"

      _error = '';
      print("Réservation du ticket $ticketId annulée");
      return true;
    } catch (e) {
      _error = 'Erreur annulation réservation ticket: ${e.toString()}';
      print("Erreur unbookTicket: $e");
      return false;
    } finally {
      _isUnbookingTicket = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Achète des tickets"
  Future<bool> purchaseTickets(PurchaseTicketsRequestDTO request) async {
    _isPurchasingTickets = true;
    _isLoading = true;
    notifyListeners();

    try {
      final purchasedTickets = await _service
          .purchaseTickets(request); // "demande à l'API d'acheter les tickets"

      _tickets.addAll(
          purchasedTickets); // "Ajoute les tickets achetés à la liste locale"
      _error = '';
      print("Tickets achetés avec succès: ${purchasedTickets.length} tickets");
      return true;
    } catch (e) {
      _error = 'Erreur achat tickets: ${e.toString()}';
      print("Erreur purchaseTickets: $e");
      return false;
    } finally {
      _isPurchasingTickets = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Transfère des tickets"
  Future<bool> transferTickets(TransferTicketsRequestDTO request) async {
    _isTransferringTickets = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.transferTickets(
          request); // "demande à l'API de transférer les tickets"

      _error = '';
      print(
          "Tickets transférés de ${request.fromUserId} vers ${request.toUserId}");
      return true;
    } catch (e) {
      _error = 'Erreur transfert tickets: ${e.toString()}';
      print("Erreur transferTickets: $e");
      return false;
    } finally {
      _isTransferringTickets = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Annule le transfert de tickets"
  Future<bool> cancelTransferTickets(
      CancelTransferTicketsRequestDTO request) async {
    _isCancelingTransfer = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.cancelTransferTickets(
          request); // "demande à l'API d'annuler le transfert de tickets"

      _error = '';
      print(
          "Transfert de tickets annulé entre ${request.fromUserId} et ${request.toUserId}");
      return true;
    } catch (e) {
      _error = 'Erreur annulation transfert tickets: ${e.toString()}';
      print("Erreur cancelTransferTickets: $e");
      return false;
    } finally {
      _isCancelingTransfer = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Débite un compte"
  Future<bool> debitAccount(DebitAccountRequestDTO request) async {
    _isDebitingAccount = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service
          .debitAccount(request); // "demande à l'API de débiter le compte"

      _error = '';
      print("Compte ${request.accountId} débité de ${request.amount}");
      return true;
    } catch (e) {
      _error = 'Erreur débit compte: ${e.toString()}';
      print("Erreur debitAccount: $e");
      return false;
    } finally {
      _isDebitingAccount = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // === MÉTHODES DE RECHERCHE ET FILTRAGE ===

  // "Charge les tickets par statut"
  Future<void> loadTicketsByStatus(String ticketStatus) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _tickets = await _service.getTicketsByStatus(ticketStatus);
      _error = '';
      print(
          "Tickets chargés par statut $ticketStatus: ${_tickets.length} tickets");
    } catch (e) {
      _error = 'Erreur chargement tickets par statut: ${e.toString()}';
      print("Erreur loadTicketsByStatus: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Charge les tickets par compte"
  Future<void> loadTicketsByAccountId(String accountId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _tickets = await _service.getTicketsByAccountId(accountId);
      _error = '';
      print(
          "Tickets chargés par compte $accountId: ${_tickets.length} tickets");
    } catch (e) {
      _error = 'Erreur chargement tickets par compte: ${e.toString()}';
      print("Erreur loadTicketsByAccountId: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // "Charge les tickets par utilisateur"
  Future<void> loadTicketsByUserId(String userId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _tickets = await _service.getTicketsByUserId(userId);
      _error = '';
      print(
          "Tickets chargés par utilisateur $userId: ${_tickets.length} tickets");
    } catch (e) {
      _error = 'Erreur chargement tickets par utilisateur: ${e.toString()}';
      print("Erreur loadTicketsByUserId: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // === MÉTHODES UTILITAIRES ===

  // "Recherche de tickets (utilise le cache local du service)"
  List<Ticket> searchTickets(String query) {
    return _service.searchTickets(query);
  }

  // "Filtre les tickets par statut"
  List<Ticket> filterTicketsByStatus(String status) {
    return _service.filterTicketsByStatus(status);
  }

  // "Filtre les tickets par type"
  List<Ticket> filterTicketsByType(String type) {
    return _service.filterTicketsByType(type);
  }

  // "Filtre les tickets réservés/non réservés"
  List<Ticket> filterTicketsByBookedStatus(bool booked) {
    return _service.filterTicketsByBookedStatus(booked);
  }

  // "Trie les tickets par prix"
  List<Ticket> sortTicketsByPrice(bool ascending) {
    return _service.sortTicketsByPrice(ascending);
  }

  // "Trie les tickets par date de création"
  List<Ticket> sortTicketsByCreationDate(bool ascending) {
    return _service.sortTicketsByCreationDate(ascending);
  }

  // "Efface le message d'erreur et notifie l'UI"
  void clearError() {
    _error = '';
    notifyListeners();
  }

  // "Efface le ticket courant et notifie l'UI"
  void clearCurrentTicket() {
    _currentTicket = null;
    notifyListeners();
  }

  // "Force le rafraîchissement des données"
  Future<void> refreshData() async {
    await loadAllTickets(forceRefresh: true);
  }

  // "Obtient les statistiques des tickets"
  Map<String, int> getTicketStatistics() {
    final statistics = <String, int>{
      'total': _tickets.length,
      'booked': _tickets.where((t) => t.booked).length,
      'available': _tickets.where((t) => !t.booked).length,
    };

    // "Compte par statut"
    for (final ticket in _tickets) {
      statistics[ticket.ticketStatus] =
          (statistics[ticket.ticketStatus] ?? 0) + 1;
    }

    // "Compte par type"
    for (final ticket in _tickets) {
      statistics[ticket.ticketType] = (statistics[ticket.ticketType] ?? 0) + 1;
    }

    return statistics;
  }

  // "Obtient tous les statuts de tickets uniques"
  List<String> getUniqueTicketStatuses() {
    final statuses =
        _tickets.map((ticket) => ticket.ticketStatus).toSet().toList();
    statuses.sort();
    return statuses;
  }

  // "Obtient tous les types de tickets uniques"
  List<String> getUniqueTicketTypes() {
    final types = _tickets.map((ticket) => ticket.ticketType).toSet().toList();
    types.sort();
    return types;
  }

  // "Calcule le revenu total des tickets"
  double getTotalRevenue() {
    return _tickets.fold(0.0, (sum, ticket) => sum + ticket.ticketPrice);
  }

  // "Vérifie si un ticket est disponible pour l'achat"
  bool isTicketAvailableForPurchase(Ticket ticket) {
    return !ticket.booked && ticket.ticketStatus == 'AVAILABLE';
  }

  // "Obtient les tickets disponibles pour l'achat"
  List<Ticket> getAvailableTicketsForPurchase() {
    return _tickets.where(isTicketAvailableForPurchase).toList();
  }
}
