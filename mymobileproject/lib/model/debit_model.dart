// Modèle représentant un débit
class Debit {
  final String debitId;
  final DateTime debitDate;
  final double debitAmount;
  final AccountDTO accountDTO;
  final UserDTO userDTO;

  // Constructeur principal
  Debit({
    required this.debitId,
    required this.debitDate,
    required this.debitAmount,
    required this.accountDTO,
    required this.userDTO,
  });

  // Factory constructor pour créer un Debit à partir d'un JSON
  factory Debit.fromJson(Map<String, dynamic> json) {
    return Debit(
      debitId: json['debitId']?.toString() ?? '',
      debitDate: DateTime.parse(json['debitDate']),
      debitAmount: (json['debitAmount'] as num?)?.toDouble() ?? 0.0,
      accountDTO: AccountDTO.fromJson(json['accountDTO']),
      userDTO: UserDTO.fromJson(json['userDTO']),
    );
  }

  /// Convertit l'objet Debit en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'debitId': debitId,
      'debitDate':
          debitDate.toIso8601String().split('T')[0], // Format YYYY-MM-DD
      'debitAmount': debitAmount,
      'accountDTO': accountDTO.toJson(),
      'userDTO': userDTO.toJson(),
    };
  }

  // Crée une copie de l'objet Debit avec des valeurs optionnelles modifiées
  /*  Debit copyWith({
    String? debitId,
    DateTime? debitDate,
    double? debitAmount,
    AccountDTO? accountDTO,
    UserDTO? userDTO,
  }) {
    return Debit(
      debitId: debitId ?? this.debitId,
      debitDate: debitDate ?? this.debitDate,
      debitAmount: debitAmount ?? this.debitAmount,
      accountDTO: accountDTO ?? this.accountDTO,
      userDTO: userDTO ?? this.userDTO,
    );
  } */

  @override
  String toString() {
    return 'Debit(debitId: $debitId, debitDate: $debitDate, debitAmount: $debitAmount, account: ${accountDTO.accountNumber}, user: ${userDTO.firstName} ${userDTO.lastName})';
  }

  /*  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Debit && other.debitId == debitId;
  }

  @override
  int get hashCode {
    return debitId.hashCode;
  } */
}

/// Modèles DTO associés (simplifiés pour l'exemple)
class AccountDTO {
  final String accountId;
  final String accountNumber;
  final double balance;

  AccountDTO({
    required this.accountId,
    required this.accountNumber,
    required this.balance,
  });

  factory AccountDTO.fromJson(Map<String, dynamic> json) {
    return AccountDTO(
      accountId: json['accountId']?.toString() ?? '',
      accountNumber: json['accountNumber'] ?? '',
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'accountNumber': accountNumber,
      'balance': balance,
    };
  }
}

class UserDTO {
  final String userId;
  final String firstName;
  final String lastName;
  final String email;

  UserDTO({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return UserDTO(
      userId: json['userId']?.toString() ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
    };
  }
}
