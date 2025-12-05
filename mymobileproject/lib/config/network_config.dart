import 'dart:io'; // Pour Platform.isAndroid, Platform.isIOS

import 'package:flutter/foundation.dart'; // Pour kIsWeb

/*
 * CLASSE DE CONFIGURATION RÉSEAU
 * 
 * Cette classe détermine dynamiquement l'URL de l'API
 * selon la plateforme d'exécution (Android, iOS, Web, etc.)
 */
class NetworkConfig {
  static String get baseUrl {
    // CAS 1: Application WEB (dans un navigateur)
    if (kIsWeb) {
      return 'http://localhost:8080';
      // Pourquoi localhost ?
      // Car le navigateur web tourne SUR LA MÊME MACHINE que Spring Boot
    } else if (Platform.isAndroid) {
      // CAS 2: Application ANDROID (émulateur ou appareil réel)
      // ADRESSE CRITIQUE pour l'émulateur Android
      return 'http://10.0.2.2:8080';
      // Pourquoi 10.0.2.2 ?
      // C'est l'adresse SPÉCIALE que l'émulateur Android utilise
      // pour accéder à la machine hôte (votre ordinateur)
    } else if (Platform.isIOS) {
      // CAS 3: Application iOS (simulateur ou appareil réel)
      return 'http://localhost:8080';
      // Pourquoi localhost ?
      // Le simulateur iOS partage le réseau avec la machine hôte
    } else {
      // CAS 4: Desktop ou autre plateforme
      return 'http://localhost:8080';
    }
  }

  // Le reste de votre configuration...
}
