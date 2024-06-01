import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:learn_firebase/update_user.dart';

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
              List<Row> userWidgets = []; // this will be displayed
              if (snapshot.hasData) {
                final users = snapshot.data?.docs.reversed.toList(); // 'users' is the snapshot at a specific point in time
                for (var user in users!) { // in here 'user' is not refere to the collaction name
                  final userWidget = Row( // 'userWidget' is a row, which contains the details of the name, email, and the mobile number of the corresponding user
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(user['name']),
                      Text(user['email']),
                      Text(user['mobile']),
                      // ** U ** update part (this part is a sub part of update part)
                      IconButton(
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>UpdateUser(userId: user.id)),);
                        }, 
                        icon: const Icon(Icons.edit)
                      ),
                      // ** D ** delete part ------------------------------------
                      IconButton(
                        onPressed: (){
                          var collection = FirebaseFirestore.instance.collection('user');
                          collection.doc(user.id).delete();
                        }, 
                        icon: const Icon(Icons.delete),
                        )
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
          ),
        ],
      ),
    );
  }
}