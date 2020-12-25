import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message, userName;
  final bool isCurrentUser;


  MessageBubble({this.message, this.isCurrentUser, this.userName});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    //The container needed to be put inside a row because
    // otherwise its width will not be respected (it is inside listView)
    return Row(
      mainAxisAlignment : isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start ,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isCurrentUser
                ? Colors.grey[300]
                : Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomLeft : !isCurrentUser ? Radius.circular(0) :Radius.circular(12),
              bottomRight : isCurrentUser ? Radius.circular(0) :Radius.circular(12)

            ),
          ),
          width: screenSize.width * 0.45,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Column(
            children: [
              Text(
                userName,
                style: TextStyle(fontWeight: FontWeight.bold)
              ),
              Text(
                message,
                style:
                    TextStyle(
                        color: isCurrentUser
                            ? Colors.black
                            : Theme.of(context).accentTextTheme.headline1.color
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
