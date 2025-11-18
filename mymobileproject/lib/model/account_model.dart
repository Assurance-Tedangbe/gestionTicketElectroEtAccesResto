import 'user_model.dart';

class Account {
  final int? accountId; // ID unique du compte (null si nouveau compte)
  final String accountNumber; // Numéro de compte unique
  final double balance; // Solde du compte
  final DateTime dateCreation; // Date de création du compte
  final User user; // Utilisateur propriétaire du compte (relation OneToOne)
  final bool active; // Statut actif/inactif du compte

  // Constructeur avec paramètres requis
  Account({
    this.accountId,
    required this.accountNumber,
    required this.balance,
    required this.dateCreation,
    required this.user,
    required this.active,
  });

  // Factory constructor pour créer un Account depuis la réponse JSON de l'API
  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json['accountId'], // Extrait l'ID du compte
      accountNumber: json['accountNumber'], // Extrait le numéro de compte
      balance: json['balance'].toDouble(), // Convertit le solde en double
      dateCreation:
          DateTime.parse(json['dateCreation']), // Parse la date de création
      user: User.fromJson(json['userDTO']), // Convertit l'utilisateur associé
      active: json['active'], // Extrait le statut actif
    );
  }

  // Objet Account →  Map JSON pour l'envoi à l'API
  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId, // Inclut l'ID du compte
      'accountNumber': accountNumber, // Inclut le numéro de compte
      'balance': balance, // Inclut le solde
      'dateCreation': dateCreation.toIso8601String(), // Format ISO pour la date
      'userDTO': user.toJson(), // Convertit l'utilisateur en JSON
      'active': active, // Inclut le statut actif
    };
  }

  // Crée une copie du compte avec certaines valeurs modifiées
  // Utile pour les mises à jour partielles
  Account copyWith({
    int? accountId,
    String? accountNumber,
    double? balance,
    DateTime? dateCreation,
    User? user,
    bool? active,
  }) {
    return Account(
      accountId: accountId ?? this.accountId,
      accountNumber: accountNumber ?? this.accountNumber,
      balance: balance ?? this.balance,
      dateCreation: dateCreation ?? this.dateCreation,
      user: user ?? this.user,
      active: active ?? this.active,
    );
  }

  // Représentation textuelle pour le débogage
  @override
  String toString() {
    return 'Account(accountId: $accountId, accountNumber: $accountNumber, balance: $balance, active: $active)';
  }

  // Compare deux comptes pour l'égalité (basé sur accountId)
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Account && other.accountId == accountId;
  }

  // HashCode pour utiliser les comptes dans les Sets et Maps
  @override
  int get hashCode => accountId.hashCode;

  /*  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json['accountId']?.toString() ?? '',
      accountNumber: json['accountNumber'] ?? '',
      balance: (json['balance'] as num?)?.toDouble() ?? 0.0,
      dateCreation: DateTime.parse(json['dateCreation']),
      user: User.fromJson(json['userDTO']),
      active: json['active'] ?? false,
    );
  } */
}
