import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp/model/chat_model.dart';

class ContactCart extends StatelessWidget {
  const ContactCart({super.key, required this.contact});

  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey[300],
              radius: 23,
              child: SvgPicture.asset(
                "assets/person.svg",
                color: Colors.white,
                height: 50,
                width: 50,
              ),
            ),
            contact.select
                ? const Positioned(
                    bottom: 3,
                    right: 6,
                    child: CircleAvatar(
                      backgroundColor: Colors.teal,
                      radius: 11,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
      title: Text(
        contact.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        contact.status,
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}
