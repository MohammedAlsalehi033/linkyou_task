import 'package:flutter/material.dart';

class UserslistCards extends StatelessWidget {
  final String avatarUrl;
  final String firstName;
  final String lastName;
  final String email;

  const UserslistCards({
    Key? key,
    required this.avatarUrl,
    required this.firstName,
    required this.lastName,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
          radius: 35.0,
        ),
        title: Text(
          '$firstName $lastName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        subtitle: Text(
          email,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 14.0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("I do nothing -_-")),
          );
        },
      ),
    );
  }
}
