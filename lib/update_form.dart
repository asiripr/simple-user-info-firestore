import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateForm extends StatefulWidget {
  final String name;
  final String email;
  final String mobile;
  final String user;
  const UpdateForm({super.key, required this.name, required this.email, required this.mobile, required this.user});

  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.name;
    emailController.text = widget.email;
    mobileController.text = widget.mobile;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
              var collection = FirebaseFirestore.instance.collection('user');
              collection.doc(widget.user).update(
                {
                  'name':nameController.text,
                  'email':emailController.text,
                  'mobile':mobileController.text
                }
              );
              Navigator.pop(context);
            }, 
            child: const Text("Update User")
          )
        ],
      );
  }
}