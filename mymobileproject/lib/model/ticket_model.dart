// lib/models/ticket_model.dart

/// Modèle représentant un ticket
class Ticket {
  final String ticketId;
  final String ticketType;
  final double ticketPrice;
  final String paymentCode;
  final bool booked;
  final String ticketStatus;
  final DateTime ticketCreationDate;
  final DateTime? ticketPurchaseDate;
  final String ticketDescription;
  final MenuDTO menuDTO;
  final UserDTO userDTO;
  final AccountDTO accountDTO;

  /// Constructeur principal
  Ticket({
    required this.ticketId,
    required this.ticketType,
    required this.ticketPrice,
    required this.paymentCode,
    required this.booked,
    required this.ticketStatus,
    required this.ticketCreationDate,
    this.ticketPurchaseDate,
    required this.ticketDescription,
    required this.menuDTO,
    required this.userDTO,
    required this.accountDTO,
  });

  /// Factory constructor pour créer un Ticket à partir d'un JSON
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      ticketId: json['ticketId']?.toString() ?? '',
      ticketType: json['ticketType'] ?? '',
      ticketPrice: (json['ticketPrice'] as num?)?.toDouble() ?? 0.0,
      paymentCode: json['paymentCode'] ?? '',
      booked: json['booked'] ?? false,
      ticketStatus: json['ticketStatus'] ?? '',
      ticketCreationDate: DateTime.parse(json['ticketCreationDate']),
      ticketPurchaseDate: json['ticketPurchaseDate'] != null
          ? DateTime.parse(json['ticketPurchaseDate'])
          : null,
      ticketDescription: json['ticketDescription'] ?? '',
      menuDTO: MenuDTO.fromJson(json['menuDTO']),
      userDTO: UserDTO.fromJson(json['userDTO']),
      accountDTO: AccountDTO.fromJson(json['accountDTO']),
    );
  }

  /// Convertit l'objet Ticket en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'ticketId': ticketId,
      'ticketType': ticketType,
      'ticketPrice': ticketPrice,
      'paymentCode': paymentCode,
      'booked': booked,
      'ticketStatus': ticketStatus,
      'ticketCreationDate': ticketCreationDate.toIso8601String(),
      'ticketPurchaseDate': ticketPurchaseDate?.toIso8601String(),
      'ticketDescription': ticketDescription,
      'menuDTO': menuDTO.toJson(),
      'userDTO': userDTO.toJson(),
      'accountDTO': accountDTO.toJson(),
    };
  }

  /// Crée une copie de l'objet Ticket avec des valeurs optionnelles modifiées
  Ticket copyWith({
    String? ticketId,
    String? ticketType,
    double? ticketPrice,
    String? paymentCode,
    bool? booked,
    String? ticketStatus,
    DateTime? ticketCreationDate,
    DateTime? ticketPurchaseDate,
    String? ticketDescription,
    MenuDTO? menuDTO,
    UserDTO? userDTO,
    AccountDTO? accountDTO,
  }) {
    return Ticket(
      ticketId: ticketId ?? this.ticketId,
      ticketType: ticketType ?? this.ticketType,
      ticketPrice: ticketPrice ?? this.ticketPrice,
      paymentCode: paymentCode ?? this.paymentCode,
      booked: booked ?? this.booked,
      ticketStatus: ticketStatus ?? this.ticketStatus,
      ticketCreationDate: ticketCreationDate ?? this.ticketCreationDate,
      ticketPurchaseDate: ticketPurchaseDate ?? this.ticketPurchaseDate,
      ticketDescription: ticketDescription ?? this.ticketDescription,
      menuDTO: menuDTO ?? this.menuDTO,
      userDTO: userDTO ?? this.userDTO,
      accountDTO: accountDTO ?? this.accountDTO,
    );
  }
}

/// Modèles DTO associés (simplifiés pour l'exemple)
class MenuDTO {
  final String menuId;
  final String menuName;

  MenuDTO({required this.menuId, required this.menuName});

  factory MenuDTO.fromJson(Map<String, dynamic> json) {
    return MenuDTO(
      menuId: json['menuId']?.toString() ?? '',
      menuName: json['menuName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'menuName': menuName,
    };
  }
}

class UserDTO {
  final String userId;
  final String firstName;
  final String lastName;

  UserDTO(
      {required this.userId, required this.firstName, required this.lastName});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      userId: json['userId']?.toString() ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}

class AccountDTO {
  final String accountId;
  final String accountNumber;

  AccountDTO({required this.accountId, required this.accountNumber});

  factory AccountDTO.fromJson(Map<String, dynamic> json) {
    return AccountDTO(
      accountId: json['accountId']?.toString() ?? '',
      accountNumber: json['accountNumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'accountNumber': accountNumber,
    };
  }
}

/// Modèles pour les requêtes complexes
class CreationTicketsRequestDTO {
  // Ajouter les propriétés nécessaires selon votre backend
  final String ticketType;
  final int quantity;

  CreationTicketsRequestDTO({required this.ticketType, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'ticketType': ticketType,
      'quantity': quantity,
    };
  }
}

class PurchaseTicketsRequestDTO {
  final AccountDTO accountDTO;
  final List<String> ticketIds;

  PurchaseTicketsRequestDTO(
      {required this.accountDTO, required this.ticketIds});

  Map<String, dynamic> toJson() {
    return {
      'accountDTO': accountDTO.toJson(),
      'ticketIds': ticketIds,
    };
  }
}

class TransferTicketsRequestDTO {
  final String fromUserId;
  final String toUserId;
  final List<String> ticketIds;

  TransferTicketsRequestDTO({
    required this.fromUserId,
    required this.toUserId,
    required this.ticketIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'ticketIds': ticketIds,
    };
  }
}

class CancelTransferTicketsRequestDTO {
  final String fromUserId;
  final String toUserId;
  final List<String> ticketIds;

  CancelTransferTicketsRequestDTO({
    required this.fromUserId,
    required this.toUserId,
    required this.ticketIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'fromUserId': fromUserId,
      'toUserId': toUserId,
      'ticketIds': ticketIds,
    };
  }
}

class DebitAccountRequestDTO {
  final String accountId;
  final double amount;

  DebitAccountRequestDTO({required this.accountId, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'amount': amount,
    };
  }
}
