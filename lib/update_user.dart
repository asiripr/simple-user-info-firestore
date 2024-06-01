import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget {
  final String userId;
  const UpdateUser({super.key, required this.userId});

  @override
  State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update User"),),
      
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('user').doc(widget.userId).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          var output = snapshot.data!.data();
          var nameValue = output!['name'];
          var emailValue = output!['email'];
          var mobileValue = output!['mobile'];

          print(nameValue);
          print(emailValue);
          print(mobileValue);
          
          return const Padding(padding: EdgeInsets.all(8.0)); 
        },
      ),
    );
  }
}