import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData iconData;

  const ProfileListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(iconData),
      title: Row(
        children: [
          Text(
            '$title: ',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            subtitle,
            // Full name
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
