import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveClient extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  SaveClient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Save User"),),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Name"
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              hintText: "Email"
            ),
          ),
          TextField(
            controller: mobileController,
            decoration: const InputDecoration(
              hintText: "Mobile"
            ),
          ),
          ElevatedButton(
            onPressed: (){
              CollectionReference collRef = FirebaseFirestore.instance.collection('user');
              collRef.add({
                'name': nameController.text,
                'email':emailController.text,
                'mobile':mobileController.text
              });
            }, 
            child: const Text("Add User"))
        ],
      ),
    );
  }
}