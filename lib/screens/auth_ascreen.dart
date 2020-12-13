import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/auth/auth_form_widget.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  void submitAuthForm(String email, String password, String username, bool shouldLogIn, BuildContext buildContext) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var authRes;
      if (shouldLogIn) {
        authRes = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        authRes = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        //Store extra data for the user that was sign in with email and password
        await Firestore.instance
            .collection('Users')
            .document(authRes.user.uid)
            .setData({
          'username': username,
          'email': email,
        });
      }
      //Firebase errors
    } on PlatformException catch (error) {
      setState(() {
        _isLoading = false;
      });
      String errorMessage = 'An error occurred, please check your credentials';

      if (error.message != null) {
        errorMessage = error.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(errorMessage),
          backgroundColor: Theme.of(buildContext).errorColor));
      //Most errors will come from firebase, this is for development
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('Chat app')),
      body: AuthFormWidget(submitAuthForm, _isLoading),
    );
  }
}
