import 'package:cloud_firestore/cloud_firestore.dart';
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
            }
            ,)
        ]),
      body: StreamBuilder(
        stream: Firestore.instance.collection(collectionPath).snapshots(),
        builder: (context, steamSnapShot){
          if(steamSnapShot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }
           final document = steamSnapShot.data.documents;
         return ListView.builder (
             itemCount: document.length,
             itemBuilder: (BuildContext context, int index) => Container(
               padding: EdgeInsets.all(8),
               child: Text(document[index]['Text']),
             ));
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Firestore.instance.collection(collectionPath).add({
            'Text' : 'Plus clicked'
          });
        }
      ),
    );
  }
}
