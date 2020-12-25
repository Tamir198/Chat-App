import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/auth_ascreen.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color pink = Colors.pink;
    return MaterialApp(
      title: 'Chat app',
      theme: ThemeData(
        primarySwatch: pink,
        backgroundColor: pink,
        accentColor: Colors.deepPurple,
        accentColorBrightness: Brightness.dark,
        //Every button will get this style by default
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: pink,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
        )
      ),
      home: StreamBuilder(stream: FirebaseAuth.instance.onAuthStateChanged,builder: (context,userSnapShot){
        return userSnapShot.hasData ? ChatScreen() : AuthScreen();
      }),
    );
  }
}


