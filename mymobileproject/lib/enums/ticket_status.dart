// 📁 Dans ticket_status.dart
enum TicketStatus {
  available,
  booked,
  used,
}

extension TicketStatusExtension on TicketStatus {
  // Pour l'affichage dans l'UI Flutter
  String get displayName => toString().split('.').last;

  /* String get displayValue {
    switch (this) {
      case TicketStatus.available:
        return 'Available';
      case TicketStatus.booked:
        return 'Booked';
      case TicketStatus.used:
        return 'Used';
    }
  } */

  // Pour la communication avec Spring Boot/ toBackend
  String get forApi {
    switch (this) {
      case TicketStatus.available:
        return 'AVAILABLE';
      case TicketStatus.booked:
        return 'BOOKED';
      case TicketStatus.used:
        return 'USED';
      /* TicketStatus.available => 'AVAILABLE',
    TicketStatus.booked => 'BOOKED',
    TicketStatus.used => 'USED' */
    }
  }

  // Pour convertir depuis l'API Spring Boot/ fromBackend
  static TicketStatus fromApi(String backendStatus) {
    switch (backendStatus.toUpperCase()) {
      case 'AVAILABLE':
        return TicketStatus.available;
      case 'BOOKED':
        return TicketStatus.booked;
      case 'USED':
        return TicketStatus.used;
      default:
        throw ArgumentError('TicketStatus inconnu: $backendStatus');
      /* 'AVAILABLE' => TicketStatus.available,
      'BOOKED' => TicketStatus.booked,
      'USED' => TicketStatus.used,
      _ => throw ArgumentError('Valeur API invalide: $apiValue'), */
    }
  }

  // For UI translation if necessary
  String get frenchLabel {
    switch (this) {
      case TicketStatus.available:
        return 'Disponible';
      case TicketStatus.booked:
        return 'Réservé';
      case TicketStatus.used:
        return 'Utilisé';
    }
  }
}

/* // 🎯 UTILISATION DANS VOTRE METHODE
Map<String, int> getTicketStatistics() {
  final statistics = <String, int>{
    'total': _tickets.length,
    'booked': _tickets.where((t) => t.booked).length,
    'available': _tickets.where((t) => !t.booked).length,
    'used': _tickets.where((t) => t.ticketStatus == TicketStatus.used).length,
  };

  for (final ticket in _tickets) {
    statistics[ticket.ticketStatus.forApi] = 
        (statistics[ticket.ticketStatus.forApi] ?? 0) + 1;
  }

  return statistics;
} */