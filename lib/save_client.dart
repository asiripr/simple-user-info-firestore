import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
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
          TextField(),
          TextField(),
          TextField(),
          ElevatedButton(onPressed: (){}, child: const Text("Add User"))
        ],
      ),
    );
  }
}