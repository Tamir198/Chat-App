import 'package:chat_app/widgets/chat/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseAuth.instance.currentUser(),
        builder: (context, futureSnapShot) {
          if (futureSnapShot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else
            return StreamBuilder(
                stream: Firestore.instance.collection('chat').orderBy('CreatedAt', descending: true).snapshots(),
                builder: (context, chatSnapShot) {
                  final chatDocuments = chatSnapShot.data.documents;
                  if (chatSnapShot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  return ListView.builder(
                    itemBuilder: (context, index) => MessageBubble(
                        message: chatDocuments[index]['Text'],
                        isCurrentUser: chatDocuments[index]['userId'] == futureSnapShot.data.uid,
                        //todo fix this is coming as null
                        userName : chatDocuments[index]['userName'],
                    ),
                    itemCount: chatDocuments.length,
                    reverse: true,
                  );
                });
        });
  }
}
