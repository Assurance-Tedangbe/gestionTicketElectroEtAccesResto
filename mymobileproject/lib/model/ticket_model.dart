import 'package:mymobileproject/enums/ticket_status.dart';
import 'package:mymobileproject/enums/ticket_type.dart';
//import 'package:mymobileproject/model/menu_model.dart';

class Ticket {
  final int? ticketId;
  final TicketType ticketType;
  final double ticketPrice;
  final String paymentCode;
  final bool booked;
  final TicketStatus ticketStatus;
  final DateTime ticketCreationDate;
  final DateTime? ticketPurchaseDate;
  final String ticketDescription;
  // final Menu menu;
  final UserDTO userDTO;
  final AccountDTO accountDTO;

  // Constructeur principal
  Ticket({
    this.ticketId,
    required this.ticketType,
    required this.ticketPrice,
    required this.paymentCode,
    required this.booked,
    required this.ticketStatus,
    required this.ticketCreationDate,
    this.ticketPurchaseDate,
    required this.ticketDescription,
    // required this.menu,
    required this.userDTO,
    required this.accountDTO,
  });

  /// Factory constructor pour créer un Ticket à partir d'un JSON
  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      // ticketId: json['ticketId']?.toString() ?? '',
      ticketId: json['ticketId'],
      //  ticketType: json['ticketType'] ?? '',
      ticketPrice: (json['ticketPrice'] as num?)?.toDouble() ?? 0.0,
      paymentCode: json['paymentCode'] ?? '',
      booked: json['booked'] ?? false,
      ticketType: TicketTypeExtension.fromBackend(json['ticketType']), // ← ICI
      ticketStatus:
          TicketStatusExtension.fromApi(json['ticketStatus']), // ← ICI
      //  ticketStatus: json['ticketStatus'] ?? '',
      ticketCreationDate: DateTime.parse(json['ticketCreationDate']),
      ticketPurchaseDate: json['ticketPurchaseDate'] != null
          ? DateTime.parse(json['ticketPurchaseDate'])
          : null,
      ticketDescription: json['ticketDescription'] ?? '',
      // menu: Menu.fromJson(json['menuDTO']),
      userDTO: UserDTO.fromJson(json['userDTO']),
      accountDTO: AccountDTO.fromJson(json['accountDTO']),
    );
  }

  /// Convertit l'objet Ticket en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'ticketId': ticketId,
      'ticketType': ticketType.toBackend, // ← ICI: Utilisation de toBackend
      'ticketPrice': ticketPrice,
      'paymentCode': paymentCode,
      'booked': booked,
      'ticketStatus': ticketStatus.forApi, // ← ICI: Utilisation de forApi
      'ticketCreationDate': ticketCreationDate.toIso8601String().split('T')[0],
      'ticketPurchaseDate': ticketPurchaseDate?.toIso8601String().split('T')[0],
      'ticketDescription': ticketDescription,
      // 'menu': menu.toJson(),
      'userDTO': userDTO.toJson(),
      'accountDTO': accountDTO.toJson(),
    };
  }

  // Crée une copie de l'objet Ticket avec des valeurs optionnelles modifiées:
  // utilisé ds TicketApiService
  Ticket copyWith({
    int? ticketId,
    TicketType? ticketType,
    double? ticketPrice,
    String? paymentCode,
    bool? booked,
    TicketStatus? ticketStatus,
    DateTime? ticketCreationDate,
    DateTime? ticketPurchaseDate,
    String? ticketDescription,
    // Menu? menu,
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
      // menu: menu ?? this.menu,
      userDTO: userDTO ?? this.userDTO,
      accountDTO: accountDTO ?? this.accountDTO,
    );
  }
}

/// Modèles DTO associés (simplifiés pour l'exemple)
/* class MenuDTO {
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
} */

class UserDTO {
  int? userId;
  final String firstName;
  final String lastName;

  UserDTO({this.userId, required this.firstName, required this.lastName});

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      userId: json['userId'],
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
  final int? accountId;
  final String accountNumber;

  AccountDTO({this.accountId, required this.accountNumber});

  factory AccountDTO.fromJson(Map<String, dynamic> json) {
    return AccountDTO(
      accountId: json['accountId'],
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

// Modèles pour les requêtes complexes
class CreationTicketsRequestDTO {
  // Represents the total number of A tickets to create
  final int countA;
  final int countB;

  CreationTicketsRequestDTO({required this.countA, required this.countB});

  Map<String, dynamic> toJson() {
    return {
      'countA': countA,
      'countB': countB,
    };
  }
}

class PurchaseTicketsRequestDTO {
  final UserDTO userDTO;
  final AccountDTO accountDTO;
  final List<int> ticketIds;

  PurchaseTicketsRequestDTO(
      {required this.userDTO,
      required this.accountDTO,
      required this.ticketIds});

  Map<String, dynamic> toJson() {
    return {
      'userDTO': userDTO.toJson(),
      'accountDTO': accountDTO.toJson(),
      'ticketIds': ticketIds,
    };
  }
}

class TransferTicketsRequestDTO {
  final int fromaccountId;
  final int toAccountId;
  final List<int> selectedTicketIdsToTransfer;

  TransferTicketsRequestDTO({
    required this.fromaccountId,
    required this.toAccountId,
    required this.selectedTicketIdsToTransfer,
  });

  Map<String, dynamic> toJson() {
    return {
      'fromaccountId': fromaccountId,
      'toAccountId': toAccountId,
      'selectedTicketIdsToTransfer': selectedTicketIdsToTransfer,
    };
  }
}

class CancelTransferTicketsRequestDTO {
  final int originalSenderAccountId;
  final int currentOwnerAccountId;
  final List<int> ticketIdsToCancel;

  CancelTransferTicketsRequestDTO({
    required this.originalSenderAccountId,
    required this.currentOwnerAccountId,
    required this.ticketIdsToCancel,
  });

  Map<String, dynamic> toJson() {
    return {
      'originalSenderAccountId': originalSenderAccountId,
      'currentOwnerAccountId': currentOwnerAccountId,
      'ticketIdsToCancel ': ticketIdsToCancel,
    };
  }
}

class DebitAccountRequestDTO {
  final String portierAccountId;
  final double etudiantAccountId;
  final List<int> ticketIds;

  DebitAccountRequestDTO(
      {required this.portierAccountId,
      required this.etudiantAccountId,
      required this.ticketIds});

  Map<String, dynamic> toJson() {
    return {
      'portierAccountId': portierAccountId,
      'etudiantAccountId': etudiantAccountId,
      'ticketIds': ticketIds
    };
  }
}
