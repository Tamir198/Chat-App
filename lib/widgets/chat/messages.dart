import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: Firestore.instance.collection('chat').orderBy('CreatedAt', descending: true).snapshots(),
      builder: (context, chatSnapShot){
        final chatDocuments = chatSnapShot.data.documents;
        if(chatSnapShot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }else
        return ListView.builder(
          itemBuilder : (context, index) => Text(chatDocuments[index]['Text']),
          itemCount: chatDocuments.length,
          reverse: true,
        );
      },
    );
  }
}
