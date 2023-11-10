import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7SdqBG5UbBWLNWtHNtB01ZrH2WEbVrXE",
            authDomain: "parkingapp-d397e.firebaseapp.com",
            projectId: "parkingapp-d397e",
            storageBucket: "parkingapp-d397e.appspot.com",
            messagingSenderId: "470976863798",
            appId: "1:470976863798:web:6422291a2e56df4e494297",
            measurementId: "G-FKYHDJ6FYV"));
  } else {
    await Firebase.initializeApp();
  }
}
