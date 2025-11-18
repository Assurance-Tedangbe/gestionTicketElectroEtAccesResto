class Menu {
  final String menuId;
  final String menuName;
  final String menuType;
  final String menuDescription;

  /// Constructeur principal
  Menu({
    required this.menuId,
    required this.menuName,
    required this.menuType,
    required this.menuDescription,
  });

  /// Factory constructor pour créer un Menu à partir d'un JSON
  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId']?.toString() ?? '',
      menuName: json['menuName'] ?? '',
      menuType: json['menuType'] ?? '',
      menuDescription: json['menuDescription'] ?? '',
    );
  }

  /// Convertit l'objet Menu en Map JSON
  Map<String, dynamic> toJson() {
    return {
      'menuId': menuId,
      'menuName': menuName,
      'menuType': menuType,
      'menuDescription': menuDescription,
    };
  }

  /// Crée une copie de l'objet Menu avec des valeurs optionnelles modifiées
  Menu copyWith({
    String? menuId,
    String? menuName,
    String? menuType,
    String? menuDescription,
  }) {
    return Menu(
      menuId: menuId ?? this.menuId,
      menuName: menuName ?? this.menuName,
      menuType: menuType ?? this.menuType,
      menuDescription: menuDescription ?? this.menuDescription,
    );
  }

  @override
  String toString() {
    return 'Menu(menuId: $menuId, menuName: $menuName, menuType: $menuType, menuDescription: $menuDescription)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Menu && other.menuId == menuId;
  }

  @override
  int get hashCode {
    return menuId.hashCode;
  }
}
