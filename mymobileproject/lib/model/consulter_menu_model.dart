// lib/models/consulter_menu_model.dart

/// Modèle représentant une consultation de menu
class ConsulterMenu {
  final String consulterMenuId;
  final DateTime consultationDate;
  final MenuDTO menuDTO;
  final UserDTO userDTO;

  /// Constructeur principal
  ConsulterMenu({
    required this.consulterMenuId,
    required this.consultationDate,
    required this.menuDTO,
    required this.userDTO,
  });

  /// Factory constructor pour créer un ConsulterMenu à partir d'un JSON
  factory ConsulterMenu.fromJson(Map<String, dynamic> json) {
    return ConsulterMenu(
      consulterMenuId: json['consulterMenuId']?.toString() ?? '',
      consultationDate: DateTime.parse(json['consultationDate']),
      menuDTO: MenuDTO.fromJson(json['menuDTO']),
      userDTO: UserDTO.fromJson(json['userDTO']),
    );
  }

  /// Convertit l'objet ConsulterMenu en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'consulterMenuId': consulterMenuId,
      'consultationDate': consultationDate.toIso8601String(),
      'menuDTO': menuDTO.toJson(),
      'userDTO': userDTO.toJson(),
    };
  }

  /// Crée une copie de l'objet ConsulterMenu avec des valeurs optionnelles modifiées
  ConsulterMenu copyWith({
    String? consulterMenuId,
    DateTime? consultationDate,
    MenuDTO? menuDTO,
    UserDTO? userDTO,
  }) {
    return ConsulterMenu(
      consulterMenuId: consulterMenuId ?? this.consulterMenuId,
      consultationDate: consultationDate ?? this.consultationDate,
      menuDTO: menuDTO ?? this.menuDTO,
      userDTO: userDTO ?? this.userDTO,
    );
  }

  @override
  String toString() {
    return 'ConsulterMenu(consulterMenuId: $consulterMenuId, consultationDate: $consultationDate, menu: ${menuDTO.menuName}, user: ${userDTO.firstName} ${userDTO.lastName})';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ConsulterMenu && other.consulterMenuId == consulterMenuId;
  }

  @override
  int get hashCode {
    return consulterMenuId.hashCode;
  }
}

// Modèles DTO associés (simplifiés pour l'exemple)
class MenuDTO {
  final String menuId;
  final String menuName;
  final String menuType;
  final String menuDescription;

  MenuDTO({
    required this.menuId,
    required this.menuName,
    required this.menuType,
    required this.menuDescription,
  });

  factory MenuDTO.fromJson(Map<String, dynamic> json) {
    return MenuDTO(
      menuId: json['menuId']?.toString() ?? '',
      menuName: json['menuName'] ?? '',
      menuType: json['menuType'] ?? '',
      menuDescription: json['menuDescription'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'menuName': menuName,
      'menuType': menuType,
      'menuDescription': menuDescription,
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
