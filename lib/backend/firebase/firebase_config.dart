import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCXAqtxVhtQqqkq8R7NCZ5JJMPAiRnCiDk",
            authDomain: "livetest-67230.firebaseapp.com",
            projectId: "livetest-67230",
            storageBucket: "livetest-67230.appspot.com",
            messagingSenderId: "553210109304",
            appId: "1:553210109304:web:0d01b251f3cffb08527c8d"));
  } else {
    await Firebase.initializeApp();
  }
}
