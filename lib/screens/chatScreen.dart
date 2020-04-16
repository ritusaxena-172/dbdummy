// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dbdummy/components/appbar_decoration.dart';
import 'package:dbdummy/model/chatModel.dart';

import 'package:dbdummy/utils/color_services.dart';
import 'package:dbdummy/utils/decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatWithName;
  final String chatWithUid;

  const ChatScreen({Key key, this.chatWithName, this.chatWithUid})
      : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  FirebaseUser user;
  var details;
  String name;
  ChatModel chatModel = ChatModel();
  getUser() async {
    user = await FirebaseAuth.instance.currentUser();
    print(user.uid);
    details =
        await Firestore.instance.collection('users').document(user.uid).get();
    name = details.data['name'].toString();
    chatId();
  }

  @override
  void initState() {
    if (chatModel.scrollController.hasClients)
      chatModel.scrollController.jumpTo(50.0);
    getUser();
    super.initState();
  }

  Future<void> callback() async {
    print(chatModel.messageController.text);
    if (chatModel.messageController.text.length > 0) {
      // chatModel.messageController.clear();
      var documentReference = Firestore.instance
          .collection('messages')
          .document(chatModel.chatId)
          .collection(chatModel.chatId)
          .document(DateTime.now().millisecondsSinceEpoch.toString());
      Firestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          {
            'text': chatModel.messageController.text,
            'from': name,
            'to': widget.chatWithName,
            'timestamp': DateTime.now().millisecondsSinceEpoch.toString(),
          },
        );
      });
      chatModel.scrollController.animateTo(
          chatModel.scrollController.position.maxScrollExtent,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 300));
    }
  }

  chatId() async {
    if (widget.chatWithUid.hashCode <= user.uid.hashCode) {
      chatModel.chatId = '${widget.chatWithUid}-${user.uid}';
    } else {
      chatModel.chatId = '${user.uid}-${widget.chatWithUid}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat with ${widget.chatWithName}'),
          flexibleSpace: Container(
            decoration: boxDecoration,
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('messages')
                    .document(chatModel.chatId)
                    .collection(chatModel.chatId)
                    .orderBy('timestamp', descending: false)
                    .limit(20)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    Text('Here is the start of your conversation');
                    return Center(child: CircularProgressIndicator());
                  }
                  List<DocumentSnapshot> docs = snapshot.data.documents;
                  List<Message> messages = docs
                      .map((doc) => Message(
                          from: doc.data['from'],
                          text: doc.data['text'],
                          to: doc.data['to'],
                          timestamp: doc.data['timestamp'],
                          me: name == doc.data['from']))
                      .toList();
                  print('after');
                  print(docs.map((doc) => doc.data['text']));
                  return ListView(
                    controller: chatModel.scrollController,
                    children: <Widget>[...messages],
                  );
                },
              )),
              Container(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      autofocus: false,
                      controller: chatModel.messageController,
                      decoration: InputDecoration(
                          hintText: 'Enter a mesaage...',
                          border: outlineTextFiled),
                    )),
                    SendButton(
                      text: "Send",
                      callback: callback,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class SendButton extends StatelessWidget {
  final String text;
  final VoidCallback callback;

  const SendButton({Key key, this.text, this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Ink(
      decoration: const ShapeDecoration(
        color: firstcolor,
        shape: CircleBorder(),
      ),
      child: IconButton(
        color: splashcolor,
        icon: Icon(Icons.send),
        onPressed: callback,
      ),
    ));
  }
}

class Message extends StatelessWidget {
  final String from;
  final String text;
  final String to;
  final String timestamp;
  final bool me;

  const Message(
      {Key key, this.from, this.text, this.to, this.timestamp, this.me})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment:
            me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(from),
          Material(
            color: me ? firstcolor : disable,
            borderRadius: BorderRadius.circular(10.0),
            elevation: 6.0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Text(text),
            ),
          )
        ],
      ),
    );
  }
}
