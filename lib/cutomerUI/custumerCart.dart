import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:whatsapp/Screens/individualPage.dart';
import 'package:whatsapp/model/chat_model.dart';

class CustomerCard extends StatefulWidget {
  final ChatModel chatmodel;

  const CustomerCard({
    Key? key,
    required this.chatmodel,
  }) : super(key: key);

  @override
  State<CustomerCard> createState() => _CustomerCardState();
}

class _CustomerCardState extends State<CustomerCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(IndividualPage(
          chatModel: widget.chatmodel,
        ));
      },
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: CircleAvatar(
            radius: 26,
            backgroundColor: Colors.grey,
            child: SvgPicture.asset(
              widget.chatmodel.isGroup
                  ? "assets/group.svg"
                  : "assets/person.svg",
              color: Colors.white,
              height: 50,
              width: 50,
            ),
          ),
          title: Text(
            widget.chatmodel.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.done_all,
                color: Color.fromARGB(255, 32, 121, 35),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(widget.chatmodel.currentMessage.toString())
            ],
          ),
          trailing: Text("${widget.chatmodel.time.toString()}"),
        ),
      ),
    );
  }
}
