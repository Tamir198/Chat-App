import 'package:flutter/material.dart';

class AuthFormWidget extends StatefulWidget {
  @override
  _AuthFormWidgetState createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  bool _shouldLoginUser = true;
  final EdgeInsets _viewSpacing = EdgeInsets.all(16);
  final GlobalKey<FormState> _formKey  = GlobalKey<FormState>();
  String _userEmail, _userName, _userPassword;

  void _trySubmitForm(){
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if(isValid){
      //will trigger onSave function for every textFormField
      _formKey.currentState.save();
      print('$_userEmail $_userName  $_userPassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: _viewSpacing,
        child: SingleChildScrollView(
          child: Padding(
            padding: _viewSpacing,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value){
                      if (value.isEmpty && !value.contains('@')){
                        return 'Please enter valid email';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'Email'),
                    onSaved: (value){
                      _userEmail = value;
                    },
                  ),
                  if(_shouldLoginUser)
                  TextFormField(
                    key: ValueKey('UserName'),

                    validator: (value){
                      if(value.isEmpty || value.length < 7){
                        return 'User Name must be longer than 6 letters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(labelText: 'UserName'),
                    onSaved: (value){
                      _userName = value;
                    },
                  ),

                  TextFormField(
                    key: ValueKey('Password'),

                    validator: (value){
                        if(value.isEmpty || value.length < 4){
                          return 'Password must be longer than 4 letters';
                        }
                        return null;
                    },
                    decoration: InputDecoration(labelText: 'Password'),
                    onSaved: (value){
                      _userPassword = value;
                    },
                    //hide text entered by the user
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  RaisedButton(
                      child: Text(_shouldLoginUser ? 'Login' : 'SignUp'),
                      onPressed: _trySubmitForm
                  ),
                  FlatButton(
                      textColor: Theme.of(context).primaryColor,
                      child: Text(_shouldLoginUser ? 'Crete new account' : 'Already have an account'),
                      onPressed: () {
                        setState(() {
                          _shouldLoginUser = !_shouldLoginUser;
                        });
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
