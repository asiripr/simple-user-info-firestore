import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase/update_form.dart';

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
          var emailValue = output['email'];
          var mobileValue = output['mobile'];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: UpdateForm(name: nameValue, email: emailValue, mobile: mobileValue, user: widget.userId,)
          ); 
        },
      ),
    );
  }
}