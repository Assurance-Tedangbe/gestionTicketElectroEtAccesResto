import 'package:flutter/foundation.dart'; // Import les bases de Flutter, dont ChangeNotifier
import 'package:mymobileproject/model/user_model.dart';
import 'package:mymobileproject/service/user_service.dart';

/* 
Rôle Principal : Gestionnaire d'État Centralisé
Votre UserProvider sert de cerveau central qui :
  - Stocke l'état de tous les utilisateurs
  - Coordonne les opérations CRUD
  - Gère le loading et les erreurs
  - Notifie l'UI des changements
 */
class UserProvider with ChangeNotifier {
  //Creates a class that can notify its listeners of changes

  // _ means these variables are private

  List<User> _users = []; // Empty list to store all users
  User? _currentUser; // Currently selected user (can be null)
  bool _isLoading =
      false; // Indicates if an operation is in progress (initially false)
  String _error = ''; // Stores error messages (initially empty)

  List<User> get users =>
      _users; // Allows other classes to read `_users` but not modify it.
  User? get currentUser => _currentUser;
  bool get isLoading => _isLoading;
  String get error => _error;

  // Charger tous les utilisateurs
  Future<void> loadAllUsers() async {
    //load the users, this will take some time (async)
    _isLoading = true; //set the status to "loading"
    _error = ''; //clear previous errors
    notifyListeners(); // notify the interface that it needs to update"

    try {
      _users = await UserApiService
          .getAllUsers(); //Ask the service to give me all the users
      _error = ''; //Confirm that there are no errors
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false; //stop the loading
      notifyListeners(); //notify the interface of the result"
    }
  }

  // Créer un utilisateur
  Future<bool> createNewUser(User user) async {
    //I'm going to create a user and I'll tell you if it worked (bool)"
    _isLoading = true;
    notifyListeners(); //start the job and notify the interface

    try {
      final newUser = await UserApiService.createUser(
          user); //"ask the service to create this user in the API"
      _users.add(newUser); //"If it works, add the new user to my local list"
      _error = ''; //Clears errors
      _isLoading = false; //Stops loading
      notifyListeners(); //Notifies the interface
      return true; // true to indicate "success""
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false; // false to indicate "failure""
    }
  }

  // Mettre à jour un utilisateur
  Future<bool> updateExistingUser(User user) async {
    _isLoading = true;
    notifyListeners();

    try {
      final updatedUser = await UserApiService.updateUser(
          user); //asking the API to update this user
      final index = _users.indexWhere((u) =>
          u.userId ==
          user.userId); //"looking for this user's position in my list:
      if (index != -1) {
        _users[index] =
            updatedUser; //If I found the user (index != -1), I replace the old version with the new one"
      }
      _error = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Supprimer un utilisateur
  Future<bool> deleteExistingUser(int userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await UserApiService.deleteUser(
          userId); //asking the API to delete the user with this ID
      _users.removeWhere((user) =>
          user.userId == userId); //"I also remove the user from my local list:
      _error = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Récupérer utilisateur par ID
  // This method returns void because the result is stored in _currentUser
  Future<void> loadUserById(int userId) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _currentUser = await UserApiService.getUserById(
          userId); //I request a specific user by its id from the API and store it in _currentUser"
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Récupérer utilisateur par username
  Future<void> loadUserByUsername(String username) async {
    _isLoading = true;
    _error = '';
    notifyListeners();

    try {
      _currentUser = await UserApiService.getUserByUsername(
          username); //I request a specific user by its username from the API and store it in _currentUser"
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Mettre à jour le mot de passe
  Future<bool> updateUserPassword(int userId, String newPassword) async {
    _isLoading = true;
    notifyListeners();

    try {
      await UserApiService.updatePassword(userId,
          newPassword); //I'm asking the API to change the password for this user"
      _error = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // Gestion des rôles
  Future<bool> addRoleToExistingUser(int userId, int roleId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await UserApiService.addRoleToUser(
          userId, roleId); //“adding a role to a user via the API”
      _error = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> removeRoleFromExistingUser(int userId, int roleId) async {
    _isLoading = true;
    notifyListeners();

    try {
      await UserApiService.removeRoleFromUser(
          userId, roleId); // removing a role from a user via the API
      _error = '';
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }

  // clear the error message and notify the interface
  void clearError() {
    _error = '';
    notifyListeners();
  }

  // forget the currently selected user and notify the interface
  void clearCurrentUser() {
    _currentUser = null;
    notifyListeners();
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
}
