import 'package:flutter/material.dart';

class AuthFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'UserName'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'UserName'),
                    //hide text entered by the user
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  RaisedButton(child: Text('Login'), onPressed: () {}),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text('Crete new account'),
                      onPressed: () {  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
