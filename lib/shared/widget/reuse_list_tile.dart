import 'package:flutter/material.dart';

class ReuseListTile extends StatelessWidget {
  final Function() onTap;
  final Color colors;
  final IconData icon;
  final String text;

  const ReuseListTile({
    super.key,
    required this.onTap,
    required this.colors,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        backgroundColor: colors,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(text, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios_outlined, size: 14),
    );
  }
}
