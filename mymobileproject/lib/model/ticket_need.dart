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
