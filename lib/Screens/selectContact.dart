import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Screens/create_group.dart';
import 'package:whatsapp/cutomerUI/button_card.dart';
import 'package:whatsapp/cutomerUI/contact-cart.dart';
import 'package:whatsapp/model/chat_model.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  List<ChatModel> contact = [
    ChatModel(name: "G Mustafa", status: "Flutter Developer"),
    ChatModel(name: "Muhammd", status: "Laravel Developer"),
    ChatModel(name: "Ahmed Raza", status: "React Native Developer"),
    ChatModel(name: "Imad Raza", status: "Full Stack Developer"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF075E54),
          title: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Contact",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "4 Contacts",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 26,
                )),
            PopupMenuButton<String>(
                onSelected: (value) {},
                itemBuilder: (BuildContext context) {
                  return [
                    const PopupMenuItem(
                      child: Text("Invite a friend"),
                      value: "Invite a friend",
                    ),
                    const PopupMenuItem(
                      child: Text("Contacts"),
                      value: "Contacts",
                    ),
                    const PopupMenuItem(
                      child: Text("Refersh"),
                      value: "Refersh",
                    ),
                    const PopupMenuItem(
                      child: Text("Help"),
                      value: "Help",
                    ),
                  ];
                }),
          ],
        ),
        body: ListView.builder(
          itemCount: contact.length + 2,
          itemBuilder: (context, index) {
            if (index == 0) {
              return InkWell(
                onTap: () {
                  Get.to(CreateGroup());
                },
                child: const ButtonCart(
                  name: 'New Group',
                  icon: Icons.group,
                ),
              );
            } else if (index == 1) {
              return const ButtonCart(
                name: 'New Contact',
                icon: Icons.person_add,
              );
            }
            return ContactCart(
              contact: contact[index - 2],
            );
          },
        ));
  }
}
