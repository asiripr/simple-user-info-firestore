import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/save_client.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBJUBCdwBZY391oNDBTDTl47e70IFggTJ0", 
      appId: "1:630169953114:android:e590007a275451334f8963", 
      messagingSenderId: "630169953114", 
      projectId: "my-second-project-1fa87"
    )
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SaveClient(),
    );
  }
}
