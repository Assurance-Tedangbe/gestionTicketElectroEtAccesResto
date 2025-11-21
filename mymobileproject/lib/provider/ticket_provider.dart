import 'package:flutter/foundation.dart'; // Importe les bases de Flutter, dont ChangeNotifier pour la gestion d'état réactive
import 'package:mymobileproject/enums/ticket_status.dart';
import 'package:mymobileproject/model/ticket_model.dart';
import 'package:mymobileproject/service/ticket_service.dart';

/*
  Rôle Principal: Gestionnaire d'état centralisé pour les tickets
  Votre TicketProvider sert de cerveau central qui :
   - Stocke l'état de tous les tickets / gère l'état de l'interface utilisateur 
   - Coordonne les opérations CRUD / actions sur les tickets 
   - Gère le loading et les erreurs
   - Notifie l'UI des changements / notifie les changements aux écouteurs

  Gère l'état de toutes les opérations du TicketApiService.
  Il sert d'intermédiaire entre l'interface utilisateur et les services backend

*/
class TicketProvider with ChangeNotifier {
  // "Crée une classe qui peut notifier ses écouteurs des changements"
  // Le mot-clé 'with' permet d'utiliser ChangeNotifier comme mixin
  // Cela permet à la classe de notifier les écouteurs quand l'état change

  // Le "_" rend ces variables privées à cette classe

  final TicketApiService _service;
  // Instance du service qui gère les appels API - injectée via le constructeur

  // === INTERNAL STATE FOR ALL OPERATIONS ===

  // === ETAT PRINCIPAL DE L'APPLICATION ===

  List<Ticket> _tickets = []; // "Liste vide pour stocker tous les tickets"
  // Liste principale qui stocke tous les tickets chargés depuis l'API

  Ticket?
      _currentTicket; // "Ticket actuellement sélectionné (peut être null si aucun ticket n'est sélectionné)"

  bool _isLoading = false; // "Indicateur de chargement (initialement false)"
  // Indicateur global de chargement - true quand une opération asynchrone est en cours

  String _error = ''; // "Stocke les messages d'erreur (initialement vide)"
  // Stocke le dernier message d'erreur rencontré, vide string signifie aucune erreur

  // === ETATS SPECIFIQUES PAR OPERATION ===
  // Ces booléens permettent de savoir précisément quelle opération est en cours

  bool _isCreatingTickets = false; // Création de nouveaux tickets en cours
  // True uniquement pendant la création de nouveaux tickets

  bool _isUpdatingTicket = false; // "Mise à jour en cours"
  bool _isDeletingTicket = false; // "Suppression en cours"
  bool _isUpdatingTicketStatus = false; // "Mise à jour statut en cours"
  bool _isBookingTicket = false; // "Réservation en cours"
  bool _isUnbookingTicket = false; // "Annulation réservation en cours"
  bool _isPurchasingTickets = false; // "Achat en cours"
  bool _isTransferringTickets = false; // "Transfert en cours"
  bool _isCancelingTransfer = false; // "Annulation transfert en cours"
  bool _isDebitingAccount = false; // "Débit compte en cours"

  // CONSTRUCTEUR
  TicketProvider(this._service);
  // Le constructeur reçoit une instance de TicketApiService en paramètre (dependency injection)

  // === GETTERS - Accès contrôlé à l'état ===
  // Les getters permettent un accès en lecture seule aux variables privées

  // 🎫 GETTERS PRINCIPAUX
  List<Ticket> get tickets =>
      _tickets; // Retourne la liste complète des tickets (en lecture seule)
  // Permet à d'autres classes de lire `_tickets` mais pas de le modifier
  Ticket? get currentTicket =>
      _currentTicket; // Retourne le ticket actuellement sélectionné (peut être null)
  bool get isLoading =>
      _isLoading; // Indique si une opération globale est en cours de chargement
  String get error => _error; // Retourne le dernier message d'erreur rencontré

  // 🎯 GETTERS POUR LES ETATS SPECIFIQUES
  bool get isCreatingTickets =>
      _isCreatingTickets; // Indique si une création de tickets est en cours
  bool get isUpdatingTicket => _isUpdatingTicket;
  bool get isDeletingTicket => _isDeletingTicket;
  bool get isUpdatingTicketStatus => _isUpdatingTicketStatus;
  bool get isBookingTicket => _isBookingTicket;
  bool get isUnbookingTicket => _isUnbookingTicket;
  bool get isPurchasingTickets => _isPurchasingTickets;
  bool get isTransferringTickets => _isTransferringTickets;
  bool get isCancelingTransfer => _isCancelingTransfer;
  bool get isDebitingAccount => _isDebitingAccount;

  // === MÉTHODES D'ACTION - OPERATIONS PRINCIPALES: Gestion complète des états ===

  // "Charge tous les tickets depuis le service"
  /*
   * 📥 CHARGE TOUS LES TICKETS DEPUIS L'API
   * @param forceRefresh : si true, ignore le cache et force le rechargement
   * @return Future<void> : opération asynchrone qui ne retourne pas de valeur
   */
  Future<void> loadAllTickets({bool forceRefresh = false}) async {
    // "charge les tickets, cela va prendre du temps (async)"
    // Début du chargement - mise à jour de l'état

    _isLoading = true; // active le chargement
    _error = ''; // efface les erreurs précédentes
    notifyListeners(); // notifie tous les écouteurs (UI) que l'état a changé/du début du chargement
    // Notifie tous les widgets écoutant ce provider

    try {
      // Appel asynchrone au service pour récupérer les tickets
      _tickets = await _service.getAllTickets(
          forceRefresh:
              forceRefresh); // "Demande au service de me donner tous les tickets"

      // Si succès : mise à jour de la liste et effacement des erreurs
      _error = ''; // "Confirme qu'il n'y a pas d'erreurs"
      print("Chargement réussi : ${_tickets.length} tickets");
    } catch (e) {
      // En cas d'erreur : stockage du message d'erreur
      _error = e.toString(); // "Stocke l'erreur"
      print("Erreur loadAllTickets: $e");
    } finally {
      // Dans tous les cas : fin du chargement et notification
      _isLoading = false; // "arrête le chargement"
      notifyListeners(); // "notifie l'UI de la fin du chargement"
    }
  }

  /*
   * ➕ CREATION DE NOUVEAUX TICKETS
   * @param request : DTO contenant les données pour créer les tickets
   * @return Future<bool> : true si succès, false si échec
   */
  Future<bool> createNewTickets(CreationTicketsRequestDTO request) async {
    // "Je vais créer des tickets et je vous dirai si ça a fonctionné (bool)"
    _isCreatingTickets = true;
    _isLoading = true;
    notifyListeners(); // "démarre le travail et notifie l'interface"

    try {
      // Appel au service pour créer les tickets via l'API
      final newTickets = await _service.createTickets(
          request); // "demande au service de créer ces tickets dans l'API"

      // Ajout des nouveaux tickets à la liste locale
      _tickets.addAll(
          newTickets); // "Si ça fonctionne, ajoute les nouveaux tickets à ma liste locale"
      _error = ''; // "Efface les erreurs"
      print("Tickets créés avec succès: ${newTickets.length} tickets");
      return true; // "Succès"
    } catch (e) {
      // Gestion de l'erreur
      _error = 'Erreur création tickets: ${e.toString()}';
      print("Erreur createNewTickets: $e");
      return false; // "Échec"
    } finally {
      // Nettoyage final
      _isCreatingTickets = false;
      _isLoading = false;
      notifyListeners(); // Notifie la fin de l'opération
    }
  }

  /*
   * ✏️ MISE A JOUR D'UN TICKET EXISTANT
   * @param ticket : le ticket avec les nouvelles données
   * @return Future<bool> : true si succès, false si échec
   */
  Future<bool> updateExistingTicket(Ticket ticket) async {
    _isUpdatingTicket = true;
    _isLoading = true;
    notifyListeners();

    try {
      // Validation des données avant envoi
      _service.validateTicketData(ticket);

      // Appel API pour mettre à jour le ticket
      final updatedTicket = await _service.updateTicket(ticket);

      // Recherche de l'index du ticket dans la liste locale
      final index = _tickets.indexWhere((t) =>
          t.ticketId ==
          ticket.ticketId); // "cherche la position de ce ticket dans ma liste"

      // Mise à jour dans la liste locale si trouvé
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

  /*
   * 🗑️ SUPPRESSION D'UN TICKET
   * @param ticketId : l'identifiant du ticket à supprimer
   * @return Future<bool> : true si succès, false si échec
   */
  Future<bool> deleteExistingTicket(String ticketId) async {
    _isDeletingTicket = true;
    _isLoading = true;
    notifyListeners();

    try {
      // Appel API pour supprimer le ticket
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

  /* Cette méthode retourne void car le résultat est stocké dans _currentTicket */
  /*
   * 🔍 CHARGEMENT D'UN TICKET SPECIFIQUE PAR SON ID
   * @param ticketId : l'identifiant du ticket à charger
   * Le résultat est stocké dans _currentTicket
   */
  Future<void> loadTicketById(int ticketId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      // Chargement du ticket depuis l'API et le stocke comme ticket courant
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

  /*
   * 🔄 MISE A JOUR DU STATUT D'UN TICKET
   * @param ticketId : l'identifiant du ticket
   * @param ticketStatus : le nouveau statut à appliquer
   * @return Future<bool> : true si succès, false si échec
   */
  Future<bool> updateTicketStatus(
      int ticketId, TicketStatus ticketStatus) async {
    _isUpdatingTicketStatus = true;
    _isLoading = true;
    notifyListeners();

    try {
      // Appel API pour changer le statut
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

  /*
   * 📅 RESERVATION D'UN TICKET
   * @param ticketId : l'identifiant du ticket à réserver
   * @return Future<bool> : true si succès, false si échec
   */
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

  /*
   * ❌ ANNULATION DE RESERVATION D'UN TICKET
   * @param ticketId : l'identifiant du ticket à désactiver
   * @return Future<bool> : true si succès, false si échec
   */
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

  /*
   * 🛒 ACHAT DE TICKETS
   * @param request : DTO contenant les infos d'achat
   * @return Future<bool> : true si succès, false si échec
   */
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

  /*
   * 🔄 TRANSFERT DE TICKETS ENTRE UTILISATEURS
   * @param request : DTO contenant les infos de transfert
   * @return Future<bool> : true si succès, false si échec
   */
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

  /*
   * ↩️ ANNULATION D'UN TRANSFERT DE TICKETS
   * @param request : DTO contenant les infos d'annulation
   * @return Future<bool> : true si succès, false si échec
   */
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

  /*
   * 💳 DEBIT D'UN COMPTE UTILISATEUR
   * @param request : DTO contenant les infos de débit
   * @return Future<bool> : true si succès, false si échec
   */
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

  /*
   * 📋 CHARGEMENT DES TICKETS PAR STATUT
   * @param ticketStatus : le statut des tickets à charger
   */
  Future<void> loadTicketsByStatus(TicketStatus ticketStatus) async {
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

  /*
   * 👤 CHARGEMENT DES TICKETS PAR COMPTE
   * @param accountId : l'identifiant du compte
   */
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

  /*
   * 👥 CHARGEMENT DES TICKETS PAR UTILISATEUR
   * @param userId : l'identifiant de l'utilisateur
   */
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

  // === MÉTHODES UTILITAIRES - OPERATIONS LOCALES ===
  /*
   * 🔍 RECHERCHE DE TICKETS DANS LE CACHE LOCAL
   * @param query : terme de recherche
   * @return List<Ticket> : liste des tickets correspondants
   */
  List<Ticket> searchTickets(String query) {
    return _service.searchTickets(query);
  }

  /*
   * 🎯 FILTRAGE DES TICKETS PAR STATUT
   * @param status : le statut à filtrer
   * @return List<Ticket> : tickets ayant ce statut
   */
  List<Ticket> filterTicketsByStatus(TicketStatus status) {
    return _service.filterTicketsByStatus(status);
  }

  /*
   * 📝 FILTRAGE DES TICKETS PAR TYPE
   * @param type : le type de ticket (A, B, etc.)
   * @return List<Ticket> : tickets de ce type
   */
  List<Ticket> filterTicketsByType(String type) {
    return _service.filterTicketsByType(type);
  }

  // "Filtre les tickets réservés/non réservés"
  /*
   * 📅 FILTRAGE DES TICKETS PAR STATUT DE RESERVATION
   * @param booked : true pour réservés, false pour disponibles
   * @return List<Ticket> : tickets correspondants
   */
  List<Ticket> filterTicketsByBookedStatus(bool booked) {
    return _service.filterTicketsByBookedStatus(booked);
  }

  /*
   * 💰 TRI DES TICKETS PAR PRIX
   * @param ascending : true pour croissant, false pour décroissant
   * @return List<Ticket> : tickets triés par prix
   */
  List<Ticket> sortTicketsByPrice(bool ascending) {
    return _service.sortTicketsByPrice(ascending);
  }

  /*
   * 📅 TRI DES TICKETS PAR DATE DE CREATION
   * @param ascending : true pour plus récents d'abord, false pour plus anciens
   * @return List<Ticket> : tickets triés par date
   */
  List<Ticket> sortTicketsByCreationDate(bool ascending) {
    return _service.sortTicketsByCreationDate(ascending);
  }

  // === MÉTHODES DE GESTION D'ÉTAT ===
  /*
   * 🧹 EFFACEMENT DU MESSAGE D'ERREUR
   * Nettoie l'erreur courante et notifie l'UI
   *   - Utile pour permettre à l'utilisateur de réessayer après une erreur
   */
  void clearError() {
    _error = '';
    notifyListeners();
  }

  /*
   * 🧹 EFFACEMENT DU TICKET COURANT
   * Réinitialise la sélection courante et notifie l'UI
   *    - Utile quand on quitte un écran de détail
   */
  void clearCurrentTicket() {
    _currentTicket = null;
    notifyListeners();
  }

  /*
   * 🔄 FORCE LE RAFRAICHISSEMENT DES DONNEES
   * Recharge tous les tickets depuis l'API en ignorant le cache
   */
  Future<void> refreshData() async {
    await loadAllTickets(forceRefresh: true);
  }

  /*
   * 📊 OBTENTION DES STATISTIQUES DES TICKETS
   * @return Map<String, int> : statistiques détaillées
   */
  /*  Map<String, int> getTicketStatistics() {
    final statistics = <String, int>{
      'total': _tickets.length,
      'booked': _tickets.where((t) => t.booked).length,
      'available': _tickets.where((t) => !t.booked).length,
      'used': _tickets.where((t) => !t.booked).length,
    };

    // Comptage par statut
    for (final ticket in _tickets) {
      statistics[ticket.ticketStatus] =
          (statistics[ticket.ticketStatus] ?? 0) + 1;
    }

    // Comptage par type"
    for (final ticket in _tickets) {
      statistics[ticket.ticketType] = (statistics[ticket.ticketType] ?? 0) + 1;
    }

    return statistics;
  } */

  /*
 * 📊 OBTENTION DES STATISTIQUES DES TICKETS
 * Cette méthode calcule et retourne diverses statistiques sur les tickets
 * @return Map<String, int> : Dictionnaire avec les statistiques détaillées
 *   - Clés : Noms des statistiques (ex: 'total', 'booked', 'AVAILABLE', 'A')
 *   - Valeurs : Nombre d'occurrences pour chaque statistique
 */
  Map<String, int> getTicketStatistics() {
    // 🎯 INITIALISATION DE LA MAP DES STATISTIQUES
    // Crée une Map vide avec des clés String et valeurs int
    final statistics = <String, int>{
      // 📈 CALCUL DES STATISTIQUES DE BASE

      'total': _tickets.length,
      // Compte le nombre total de tickets dans la liste _tickets

      'booked': _tickets.where((t) => t.booked).length,
      // Filtre les tickets réservés (t.booked == true) et compte leur nombre
      // Exemple: Si 3 tickets ont booked=true, retourne 3

      'available': _tickets.where((t) => !t.booked).length,
      // Filtre les tickets disponibles (t.booked == false) et compte leur nombre
      // Exemple: Si 7 tickets ont booked=false, retourne 7

      'used': _tickets.where((t) => !t.booked).length,
      // ⚠️ BUG POTENTIEL : Même calcul que 'available'
      // Probablement devrait être: _tickets.where((t) => t.ticketStatus == 'USED').length
      // Actuellement, compte aussi les tickets non réservés
    };

    // 🎯 COMPTAGE PAR STATUT - CONVERSION EN STRING
    for (final ticket in _tickets) {
      // Convertit TicketStatus enum → String
      final statusKey = ticket.ticketStatus.toString().split('.').last;
      // Explication :
      // TicketStatus.AVAILABLE.toString() → "TicketStatus.AVAILABLE"
      // .split('.') → ["TicketStatus", "AVAILABLE"]
      // .last → "AVAILABLE"

      statistics[statusKey] = (statistics[statusKey] ?? 0) + 1;
    }

    // 🔄 COMPTAGE PAR STATUT DES TICKETS
    // Cette boucle compte combien de tickets ont chaque statut (AVAILABLE, BOOKED, USED, etc.)
    /*  for (final ticket in _tickets) {
      // Pour chaque ticket dans la liste _tickets:

      statistics[ticket.ticketStatus] =
          (statistics[ticket.ticketStatus] ?? 0) + 1;
      // Explication détaillée de cette ligne :
      // 1. ticket.ticketStatus → Récupère le statut du ticket (ex: 'AVAILABLE')
      // 2. statistics['AVAILABLE'] ?? 0 →
      //    - Si la clé 'AVAILABLE' existe, prend sa valeur
      //    - Si elle n'existe pas, utilise 0 comme valeur par défaut
      // 3. + 1 → Ajoute 1 au compteur
      // 4. statistics['AVAILABLE'] = ... → Stocke la nouvelle valeur

      // Exemple d'exécution :
      // Premier ticket AVAILABLE: statistics['AVAILABLE'] = (null ?? 0) + 1 = 1
      // Deuxième ticket AVAILABLE: statistics['AVAILABLE'] = (1 ?? 0) + 1 = 2
      // Premier ticket BOOKED: statistics['BOOKED'] = (null ?? 0) + 1 = 1
    } */

    // 🔄 COMPTAGE PAR TYPE DE TICKET
    // Cette boucle compte combien de tickets ont chaque type (A, B, etc.)
    for (final ticket in _tickets) {
      // Pour chaque ticket dans la liste _tickets:

      statistics[ticket.ticketType] = (statistics[ticket.ticketType] ?? 0) + 1;
      // Même logique que pour les statuts mais avec le type de ticket
      // Exemple :
      // Premier ticket type A: statistics['A'] = (null ?? 0) + 1 = 1
      // Deuxième ticket type A: statistics['A'] = (1 ?? 0) + 1 = 2
      // Premier ticket type B: statistics['B'] = (null ?? 0) + 1 = 1
    }

    // 📤 RETOUR DES STATISTIQUES COMPLÈTES
    return statistics;
    // La Map retournée contient maintenant toutes les statistiques calculées
  }

  // "Obtient tous les statuts de tickets uniques"
  /*
   * 🎯 OBTENTION DE TOUS LES STATUTS UNIQUES
   * @return List<TicketStatus> : liste des statuts existants
   */
  List<TicketStatus> getUniqueTicketStatuses() {
    final statuses =
        _tickets.map((ticket) => ticket.ticketStatus).toSet().toList();
    statuses.sort();
    return statuses;
  }

  // "Obtient tous les types de tickets uniques"
  /*
   * 📝 OBTENTION DE TOUS LES TYPES UNIQUES
   * @return List<String> : liste des types de tickets existants
   */
  List<String> getUniqueTicketTypes() {
    final types = _tickets.map((ticket) => ticket.ticketType).toSet().toList();
    types.sort();
    return types;
  }

  /*
   * 💰 CALCUL DU REVENU TOTAL
   * @return double : somme des prix de tous les tickets
   */
  double getTotalRevenue() {
    return _tickets.fold(0.0, (sum, ticket) => sum + ticket.ticketPrice);
  }

  /*
   * ✅ VERIFICATION DE DISPONIBILITE D'UN TICKET POUR ACHAT
   * @param ticket : le ticket à vérifier
   * @return bool : true si le ticket peut être acheté
   */
  bool isTicketAvailableForPurchase(Ticket ticket) {
    return !ticket.booked && ticket.ticketStatus == 'AVAILABLE';
  }

  /*
   * 🛒 OBTENTION DES TICKETS DISPONIBLES POUR ACHAT
   * @return List<Ticket> : liste des tickets achetable
   */
  List<Ticket> getAvailableTicketsForPurchase() {
    return _tickets.where(isTicketAvailableForPurchase).toList();
  }
}
