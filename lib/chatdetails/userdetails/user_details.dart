import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kids_math_play/chatdetails/all_method/all_method.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('User Details'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("allUsers").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(snapshot.data!.docs[index]['Email']),
                          subtitle:
                              Text(snapshot.data!.docs[index]['Password']),
                          trailing: IconButton(
                              onPressed: () {

                              },
                              icon: Icon(Icons.delete)));
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.hasError.toString()),
                );
              } else {
                return const Center(
                  child: Text('No Data Found'),
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
