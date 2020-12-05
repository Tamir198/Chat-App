import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.all(8),
                child: Text('Dummy data'),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          //This is a stream that listen to changes inside cloud firestore
          Firestore.instance.collection('Chats/12dS8Qv2FgFDhzsiaavq/messages').snapshots().listen((event) {
            print(event.documents[0]['Text']);

            event.documents.forEach((element) {
              print(element['Text']);
            });
          });
        }
      ),
    );
  }
}
