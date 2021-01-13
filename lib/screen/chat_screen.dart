import 'package:chatapp/Widget/messages.dart';
import 'package:chatapp/Widget/new_messages.dart';
import 'package:chatapp/screen/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Secure Chat'),
        leading: Container(),
        centerTitle: true,
        actions: [
          DropdownButton(
            onChanged: (item) {
              if (item == 'logout') {
                FirebaseAuth.instance.signOut();
                print('logout');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              }
            },
            icon: Icon(Icons.more_vert,color: Colors.white,),
            items: [
              DropdownMenuItem(
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      SizedBox(width: 25),
                      Text('Logout')
                    ],
                  ),
                ),
                value: 'logout',
              )
            ],
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
