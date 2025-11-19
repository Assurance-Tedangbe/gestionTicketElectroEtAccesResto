enum TicketStatus { available, booked, used }

extension TicketStatusExtension on TicketStatus {
  String get displayValue {
    switch (this) {
      case TicketStatus.available:
        return 'Available';
      case TicketStatus.booked:
        return 'Booked';
      case TicketStatus.used:
        return 'Used';
    }
  }

  // Conversion from the backend
  static TicketStatus fromBackend(String backendStatus) {
    switch (backendStatus.toUpperCase()) {
      case 'AVAILABLE':
        return TicketStatus.available;
      case 'BOOKED':
        return TicketStatus.booked;
      case 'USED':
        return TicketStatus.used;
      default:
        throw ArgumentError('TicketStatus inconnu: $backendStatus');
    }
  }

  // Conversion to the backend
  String get toBackend {
    switch (this) {
      case TicketStatus.available:
        return 'AVAILABLE';
      case TicketStatus.booked:
        return 'BOOKED';
      case TicketStatus.used:
        return 'USED';
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
