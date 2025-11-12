class Role {
  final int? roleId; // ID optionnel (null si nouveau rôle)
  final String roleName;

  // Constructor with required named parameters
  Role({
    this.roleId,
    required this.roleName,
  });

  // Factory constructor to create a Role from JSON
  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      roleId: json['roleId'], // Extracting the ID from JSON
      roleName: json['roleName'],
    );
  }

  // Role → JSON conversion for sending to the API
  Map<String, dynamic> toJson() {
    return {
      'roleId': roleId,
      'roleName': roleName,
    };
  }
}
