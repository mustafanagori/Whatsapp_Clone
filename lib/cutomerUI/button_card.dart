import 'package:flutter/material.dart';

class ButtonCart extends StatelessWidget {
  const ButtonCart({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Color(0xFF25D366),
          radius: 23,
          child: Icon(
            icon,
            color: Colors.white,
          )),
      title: Text(
        name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}
