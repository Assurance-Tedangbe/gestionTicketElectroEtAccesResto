import 'package:flutter/foundation.dart'; // Import les bases de Flutter, dont ChangeNotifier
import 'package:mymobileproject/model/user_model.dart';
import 'package:mymobileproject/service/user_service.dart';

/*
  Rôle Principal: Gestionnaire d'état entralisé pour les utilisateurs
  Votre UserProvider sert de cerveau central qui :
   - Stocke l'état de tous les utilisateurs / gére l'état de l'interface utilisateur 
   - Coordonne les opérations CRUD / actions utilisateur 
   - Gère le loading et les erreurs
   - Notifie l'UI des changements / notifie les changements aux écouteurs

  Gère l'état de toutes les opérations du UserApiService
*/
class UserProvider with ChangeNotifier {
  //Creates a class that can notify its listeners of changes

  // _ means these variables are private

  final UserApiService _service;

  // === INTERNAL STATE FOR ALL OPERATIONS ===

  // Main state
  List<User> _users = []; // Empty list to store all users
  User? _currentUser; // Currently selected user (can be null)
  bool _isLoading = false; // load indicator (initially false)
  String _error = ''; // Stores error messages (initially empty)

  // State for specific operations
  bool _isCreatingUser = false; // Creation in progress
  bool _isUpdatingUser = false; // Update in progress
  bool _isDeletingUser = false; // Deletion in progress
  bool _isUpdatingPassword = false; // Password change in progress
  bool _isAddRoleToUser = false; // Adding role to user in progress
  bool _isRemoveRoleFromUser = false; // Remove role from user in progress

  // Specific error messages
  /* String _createUserError = '';
  String _updateUserError = '';
  String _deleteUserError = '';
  String _updatePasswordError = '';
  String _manageRoleError = ''; */

  UserProvider(this._service);

  // === GETTERS - Accès contrôlé à l'état ===

  // Main Getters
  List<User> get users =>
      _users; // Allows other classes to read `_users` but not modify it.
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Getters for specific states
  bool get isCreatingUser => _isCreatingUser;
  bool get isUpdatingUser => _isUpdatingUser;
  bool get isDeletingUser => _isDeletingUser;
  bool get isUpdatingPassword => _isUpdatingPassword;
  bool get isAddRoleToUser => _isAddRoleToUser;
  bool get isRemoveRoleFromUser => _isRemoveRoleFromUser;

  // Getters for specific errors
  /* String get createUserError => _createUserError;
  String get updateUserError => _updateUserError;
  String get deleteUserError => _deleteUserError;
  String get updatePasswordError => _updatePasswordError;
  String get manageRoleError => _manageRoleError; */

  // === MÉTHODES D'ACTION - Gestion complète des états ===

  // Load all users from the service
  Future<void> loadAllUsers({bool forceRefresh = false}) async {
    //load the users, this will take some time (async)

    _isLoading = true; // activate the loading
    _error = ''; // clear previous errors
    notifyListeners(); // notify the UI of the loading begin

    try {
      _users = await _service.getAllUsers(
          forceRefresh:
              forceRefresh); //Ask the service to give me all the users
      _error = ''; //Confirm that there are no errors
      print(" successfully laoding : ${_users.length} users");
    } catch (e) {
      _error = e.toString(); // Stocke l'erreur
      print(" Error loadAllUsers: $e");
    } finally {
      _isLoading = false; // stop the loading
      notifyListeners(); // notify the UI of the loading end"
    }
  }

  // Create a new user
  Future<bool> createNewUser(User user) async {
    //I'm going to create a user and I'll tell you if it worked (bool)"
    _isCreatingUser = true;
    _isLoading = true;
    notifyListeners(); //start the job and notify the interface

    try {
      // Validate the data before creation
      _service.validateUserData(user);

      final newUser = await _service
          .createUser(user); // ask the service to create this user in the API
      _users.add(newUser); // If it works, add the new user to my local list
      _error = ''; // Clears errors
      // _isCreatingUser = false;
      // _isLoading = false; // Stops loading
      //   notifyListeners(); // Notifies the UI
      print(" User created successfully: ${newUser.username}");
      return true; // Success
    } catch (e) {
      _error = 'Error creation: ${e.toString()}';
      print("Erreur createNewUser: $e");
      // _isCreatingUser = false;
      // _isLoading = false;
      // notifyListeners();
      return false; // Failure
    } finally {
      _isCreatingUser = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // Updates an existing user
  Future<bool> updateExistingUser(User user) async {
    _isUpdatingUser = true;
    _isLoading = true;
    notifyListeners();

    try {
      _service.validateUserData(user);

      final updatedUser =
          await _service.updateUser(user); //asking the API to update this user

      // Updates in the local list
      final index = _users.indexWhere((u) =>
          u.userId ==
          user.userId); //looking for this user's position in my list
      if (index != -1) {
        _users[index] =
            updatedUser; //If I found the user (index != -1), I replace the old version with the new one"
      }

      _error = '';
      print(" User updated successfully: ${updatedUser.username}");
      return true;
    } catch (e) {
      _error = 'Error updating user: ${e.toString()}';
      print(" Error updateExistingUser: $e");
      return false;
    } finally {
      _isUpdatingUser = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // Delete a user
  Future<bool> deleteExistingUser(int userId) async {
    _isDeletingUser = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service
          .deleteUser(userId); //asking the API to delete the user with this ID

      // remove the user from the local list
      _users.removeWhere((user) => user.userId == userId);

      _error = '';
      //_isLoading = false;
      //notifyListeners();
      print(" User with this ID deleted: $userId");
      return true;
    } catch (e) {
      _error = 'Error deleting: ${e.toString()}';
      print("Error deleteExistingUser: $e");
      // _isLoading = false;
      //notifyListeners();
      return false;
    } finally {
      _isDeletingUser = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  /* Loads a specific user by its ID
     This method returns void because the result is stored in _currentUser */
  Future<void> loadUserById(int userId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _currentUser = await _service.getUserById(
          userId); //request a specific user by its id from the API and store it in _currentUser"
      _error = '';
      print(" User loaded by ID: $userId");
    } catch (e) {
      _error = 'Error loading user: ${e.toString()}';
      print("Error loadUserById: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Load a specific user by its username
  Future<void> loadUserByUsername(String username) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _currentUser = await _service.getUserByUsername(
          username); //I request a specific user by its username from the API and store it in _currentUser"
      _error = '';
      print(" User loaded with username: $username");
    } catch (e) {
      _error = 'Error loading user with username: ${e.toString()}';
      print(" Error loadUserByUsername: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Update password
  Future<bool> updateUserPassword(int userId, String newPassword) async {
    _isUpdatingPassword = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.updatePassword(userId,
          newPassword); //I'm asking the API to change the password for this user"

      _error = '';
      print(" User password updated successfully: $newPassword");
      // _isLoading = false;
      // notifyListeners();
      return true;
    } catch (e) {
      _error = 'Error updating user password: ${e.toString()}';
      print("Error updatePassword: $e");
      //  _isLoading = false;
      //  notifyListeners();
      return false;
    } finally {
      _isUpdatingPassword = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // Add role to an existing user
  Future<bool> addRoleToExistingUser(int userId, int roleId) async {
    _isAddRoleToUser = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.addRoleToUser(
          userId, roleId); //“adding a role to a user via the API”

      _error = '';
      print("Role $roleId added to user $userId");
      // _isLoading = false;
      // notifyListeners();
      return true;
    } catch (e) {
      _error = 'Error adding role: ${e.toString()}';
      print(" Error addRoleToUser: $e");
      // _isLoading = false;
      // notifyListeners();
      return false;
    } finally {
      _isAddRoleToUser = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // Remove role from an existing user
  Future<bool> removeRoleFromExistingUser(int userId, int roleId) async {
    _isRemoveRoleFromUser = true;
    _isLoading = true;
    notifyListeners();

    try {
      await _service.removeRoleFromUser(
          userId, roleId); // removing a role from a user via the API
      _error = '';
      print("✅ Role $roleId removed from user $userId");

      //  _isLoading = false;
      //  notifyListeners();
      return true;
    } catch (e) {
      _error = 'Error removing role: ${e.toString()}';
      print(" Error removeRoleFromUser: $e");
      //  _isLoading = false;
      //  notifyListeners();
      return false;
    } finally {
      _isRemoveRoleFromUser = false;
      _isLoading = false;
      notifyListeners();
    }
  }

  // === MÉTHODES UTILITAIRES ===

  // Searching for users (uses the service's local cache)
  List<User> searchUsers(String query) {
    return _service.searchUsers(query);
  }

  // Clear the error message and notify the UI
  void clearError() {
    _error = '';
    notifyListeners();
  }

  // Clear the current user and notify the UI
  void clearCurrentUser() {
    _currentUser = null;
    notifyListeners();
  }

  // Force data refresh
  Future<void> refreshData() async {
    await loadAllUsers(forceRefresh: true);
  }
}

/* 
   RÉSUMÉ DU PATTERN GÉNÉRAL
   Chaque méthode suit le même schéma :

    - DÉBUT → _isLoading = true + notifyListeners()
    - ESSAIE → Appel API + traitement des données
    - SUCCÈS → Met à jour l'état + notifyListeners() + retourne true
    - ÉCHEC → Stocke l'erreur + notifyListeners() + retourne false

    Le notifyListeners() est le cri magique qui dit à Flutter :
    Mes données ont changé ! Reconstruis tous les widgets qui m'écoutent !"
    C'est ce qui rend votre interface réactive et automatiquement mise à jour 
   */
