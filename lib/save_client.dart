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
          // ---------------------------------------------------------------------------
          // ** C ** create part
          ElevatedButton(
            onPressed: (){
              CollectionReference collRef = FirebaseFirestore.instance.collection('user');
              collRef.add({
                'name': nameController.text,
                'email':emailController.text,
                'mobile':mobileController.text
              });
              nameController.clear();
              emailController.clear();
              mobileController.clear();
            }, 
            child: const Text("Add User")
          ),
          // ---------------------------------------------------------------------------
          // ** R ** read part
          const SizedBox(height: 30,),
          const Text("---User Details---"),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('user').snapshots(), 
            builder: (context,snapshot){
              List<Row> userWidgets = [];
              if (snapshot.hasData) {
                final users = snapshot.data?.docs.reversed.toList();
                for (var user in users!) {
                  final userWidget = Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(user['name']),
                      Text(user['email']),
                      Text(user['mobile']),
                    ],
                  );
                  userWidgets.add(userWidget);
                }
              }
              return Expanded(
                child: ListView(
                  children: userWidgets,
                ),
              );
            }
          )

        ],
      ),
    );
  }
}