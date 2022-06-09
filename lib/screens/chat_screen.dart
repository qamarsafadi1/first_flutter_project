import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_project/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
late User loggedIn;

class ChatScreen extends StatefulWidget {
  static String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String messageText;
  final messageController = TextEditingController();

  @override
  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedIn = user;
        print(loggedIn.email);
      }
    } catch (e) {
      print(e);
    }
  }

  void messageStream() async {
    await for (var snapshot in _firestore
        .collection('messages')
        .orderBy("text", descending: true)
        .snapshots()) {
      for (var messages in snapshot.docs) {
        print(messages);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      style: TextStyle(color: Colors.black),
                      controller: messageController,
                      onChanged: (value) {
                        messageText = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageController.clear();
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedIn.email,
                        'timestamp':
                            DateTime.now().toUtc().millisecondsSinceEpoch,
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  const MessageStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection('messages')
            .orderBy('timestamp', descending: false)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final messages = snapshot.data!.docs;
          List<MessageBubble> messagesWidget = [];
          for (var message in messages) {
            final text = message.get('text');
            final sender = message.get('sender');
            final currentUser = loggedIn.email;

            final textWidget = MessageBubble(
              text: text,
              sender: sender,
              isMe: sender == currentUser,
            );
            messagesWidget.add(textWidget);
          }
          return Expanded(
              child: ListView(
            children: messagesWidget,
          ));
        });
  }
}

class MessageBubble extends StatelessWidget {
  final String text;
  final String sender;
  final bool isMe;

  MessageBubble({required this.text, required this.sender, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
            elevation: 5,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
