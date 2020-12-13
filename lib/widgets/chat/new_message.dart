import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NewMessageWidget extends StatefulWidget {
  @override
  _NewMessageWidgetState createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  String _userMessage = '';
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {
    FocusScope.of(context).unfocus();
    Firestore.instance.collection('chat').add({
      'Text': _userMessage,
      'CreatedAt' : Timestamp.now()
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                decoration: InputDecoration(labelText: 'Send message'),
                onChanged: (value) {
                  setState(() {
                    _userMessage = value;
                  });
                }),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            icon: Icon(Icons.send),
            onPressed: () {
              _userMessage.trim().isEmpty ? null : _sendMessage();
            },
          )
        ],
      ),
    );
  }
}