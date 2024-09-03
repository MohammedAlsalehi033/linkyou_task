import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkyou_task/Services/APIManger.dart';
import 'package:linkyou_task/Widgets/UsersListCards.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final User? user = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Main Screen"), centerTitle: true,),
      body: Align(heightFactor: double.infinity,alignment: Alignment.center,
        child:  FutureBuilder<Map<String, dynamic>>(
          future: listUsers(), builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<dynamic> users = snapshot.data!['data'];
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  var user = users[index];
                  return UserslistCards(
                  avatarUrl: user['avatar'],
                  firstName: user['first_name'],
                  lastName: user['last_name'],
                  email: user['email'],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),

    );
  }
}
