import 'package:flutter/material.dart';
import 'package:q2/models/person.dart';

class PersonTile extends StatelessWidget {
  final Person person;
  final VoidCallback? onTap;
  const PersonTile({
    super.key,
    required this.person,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(person.pictureUrl),
      ),
      title: Text(person.fullName),
      subtitle: Text(person.email),
    );
  }
}
