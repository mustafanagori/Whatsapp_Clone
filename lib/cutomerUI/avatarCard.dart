import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp/model/chat_model.dart';

class AvatarCart extends StatelessWidget {
  const AvatarCart({super.key, required this.contact});
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blueGrey[300],
                  radius: 25,
                  child: SvgPicture.asset(
                    "assets/person.svg",
                    color: Colors.white,
                    height: 50,
                    width: 50,
                  ),
                ),
                const Positioned(
                  bottom: 2,
                  right: 6,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                contact.name,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
