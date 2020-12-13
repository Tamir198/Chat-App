import 'package:chat_app/widgets/chat/messages.dart';
import 'package:chat_app/widgets/chat/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  String collectionPath = 'Chats/12dS8Qv2FgFDhzsiaavq/messages';
  String logOut = 'Logout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('chat app'),
        actions: [
          DropdownButton(
            icon: Icon(Icons.more_vert, color: Theme.of(context).primaryIconTheme.color),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(children: [
                    Icon(Icons.exit_to_app),
                    SizedBox(width: 8),
                    Text(logOut)
                  ]),
                ),
                value: logOut,
              )],
            onChanged: (itemValue){
              if(itemValue == logOut){
                FirebaseAuth.instance.signOut();
              }
            })
        ]),
      body: Container(
        child: Column(
          children: [
            Expanded(child: MessagesWidget()),
            NewMessageWidget()

          ],
        )
      ),
    );
  }
}
