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
    );
  }
}