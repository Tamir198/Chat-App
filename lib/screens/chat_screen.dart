import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  String collectionPath = 'Chats/12dS8Qv2FgFDhzsiaavq/messages';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
