import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymobileproject/model/user_model.dart';

//Creates a class that handles all communication with the API
class UserApiService {
  /* Use the IP address of the Android emulator (10.0.2.2)
  or your machine's IP address for other emulators/devices. */
  static const String baseUrl = 'http://10.0.2.2:8080/api/users';

  // Configure HTTP headers for all requests
  static final Map<String, String> headers = {
    'Content-Type': 'application/json', // Tells the server "I'm sending JSON"
    'Accept': 'application/json', // Tells the server "I want to receive JSON"

    /* Add an Authorization header here if you are using Spring Security
      'Authorization': 'Bearer your_jwt_token', */
  };

  // -------------------------
  // 1. CREATE USER (POST /api/users)
  // -------------------------
  static Future<User> createUser(User user) async {
    // I will create a user via POST /api/users and return the created user"

    try {
      final response = await http.post(
        // I'm trying to send a POST request:

        Uri.parse(baseUrl), // Converts the URL string to a Uri object
        headers: headers, // Uses the configured headers
        body: json.encode(
            user.toJson()), // Converts the User object to a JSON string"
      );

      if (response.statusCode == 201) {
        return User.fromJson(json.decode(
            response.body)); // Converts the JSON response into a User object
      } else {
        throw Exception('Erreur création utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 2. READ ALL USERS (GET /api/users)
  // -------------------------
  static Future<List<User>> getAllUsers() async {
    try {
      final response = await http.get(
        Uri.parse(baseUrl),
        headers: headers,
      ); // I do a GET /api/users to retrieve all users

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response
            .body); // Converts the JSON string into a List of Dart objects

        return jsonList
            .map((json) => User.fromJson(json))
            .toList(); //Transforms each JSON object into a User object"
      } else {
        throw Exception(
            'Erreur récupération utilisateurs: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 3. READ USER BY ID (GET /api/users/{userId})
  // -------------------------
  static Future<User> getUserById(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$userId'),
        headers: headers,
      ); // GET /api/users/{userId} to retrieve a specific user"

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Utilisateur non trouvé');
      } else {
        throw Exception(
            'Erreur récupération utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 4. READ USER BY USERNAME (GET /api/users/username/{username})
  // -------------------------
  static Future<User> getUserByUsername(String username) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/username/$username'),
        headers: headers,
      ); // GET /api/users/username/{username} to find a user by username"

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else if (response.statusCode == 404) {
        throw Exception('Utilisateur non trouvé');
      } else {
        throw Exception(
            'Erreur récupération utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 5. UPDATE USER (PUT /api/users/{userId})
  // -------------------------
  static Future<User> updateUser(User user) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${user.userId}'),
        headers: headers,
        body: json.encode(user.toJson()), // Sends the new data"
      ); // PUT /api/users/{userId} to modify an existing user

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw Exception(
            'Erreur mise à jour utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 6. UPDATE PASSWORD (PUT /api/users/password/{userId})
  // -------------------------
  static Future<void> updatePassword(int userId, String newPassword) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/password/$userId'),
        headers: headers,
        body: json.encode(
            newPassword), // Sends only the new password (not the entire User object)"
      );

      if (response.statusCode != 200) {
        throw Exception(
            'Erreur mise à jour mot de passe: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 7. DELETE USER (DELETE /api/users/{userId})
  // -------------------------
  static Future<void> deleteUser(int userId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$userId'),
        headers: headers,
      );

      if (response.statusCode != 204) {
        throw Exception(
            'Erreur suppression utilisateur: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 8. ADD ROLE TO USER (PUT /api/users/{userId}/roles/{roleId})
  // -------------------------
  static Future<void> addRoleToUser(int userId, int roleId) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/$userId/roles/$roleId'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Erreur ajout rôle: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  // -------------------------
  // 9. REMOVE ROLE FROM USER (DELETE /api/users/{userId}/roles/{roleId})
  // -------------------------
  static Future<void> removeRoleFromUser(int userId, int roleId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/$userId/roles/$roleId'),
        headers: headers,
      );

      if (response.statusCode != 200) {
        throw Exception('Erreur retrait rôle: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau: $e');
    }
  }

  /* 
   RÉSUMÉ DU PATTERN GÉNÉRAL
   Chaque méthode suit le même schéma :

     static Future<Type> nomMéthode(paramètres) async {
     try {
        1. 🟡 CONSTRUCTION DE LA REQUÊTE
          final response = await http.méthode(
          Uri.parse(url),
          headers: headers,
          body: données?,
         );

        2. 🟢 VÉRIFICATION DE LA RÉPONSE
      if (response.statusCode == codeSuccès) {

        3. ✅ TRANSFORMATION DES DONNÉES
         return transformation(response.body);
         } else {
        4. ❌ ERREUR HTTP
                 throw Exception('Message: ${response.statusCode}');
                }
    
          } catch (e) {
        5. 🔴 ERREUR RÉSEAU
                throw Exception('Erreur réseau: $e');
          }
       }
   */

  /* 
   CONVERSION DES DONNÉES
   Flux de données dans les deux sens :

   VERS L'API (Envoi)
   Objet User Dart → user.toJson() → Map → json.encode() → String JSON → HTTP Body
   
   DEPUIS L'API (Réception)
   HTTP Body → String JSON → json.decode() → Map → User.fromJson() → Objet User Dart

   Ce service est le pont essentiel entre votre app Flutter et votre API Spring Boot ! 🌉
   */
}
