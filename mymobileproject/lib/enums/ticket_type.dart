enum TicketType { a, b }

extension TicketTypeExtension on TicketType {
  String get displayValue {
    switch (this) {
      case TicketType.a:
        return 'a';
      case TicketType.b:
        return 'b';
    }
  }

  // Conversion from the backend
  static TicketType fromBackend(String backendType) {
    switch (backendType.toUpperCase()) {
      case 'A':
        return TicketType.a;
      case 'B':
        return TicketType.b;
      default:
        throw ArgumentError('Ticket inconnu: $backendType');
    }
  }

  // Conversion to the backend
  String get toBackend {
    switch (this) {
      case TicketType.a:
        return 'A';
      case TicketType.b:
        return 'B';
    }
  }
}
