import 'package:flutter/material.dart';
import 'package:reqres/feature/user_list/_user_list_exports.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(user.avatar), radius: 24),
      title: Text(user.firstName + user.lastName),
      subtitle: Text(user.email),
    );
  }
}
