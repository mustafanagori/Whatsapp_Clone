import 'package:flutter/material.dart';
import 'package:whatsapp/cutomerUI/avatarCard.dart';
import 'package:whatsapp/cutomerUI/contact-cart.dart';
import 'package:whatsapp/model/chat_model.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contact = [
    ChatModel(name: "G Mustafa", status: "Flutter Developer"),
    ChatModel(name: "Muhammd", status: "Laravel Developer"),
    ChatModel(name: "Ahmed Raza", status: "React Native Developer"),
    ChatModel(name: "Imad Raza", status: "Full Stack Developer"),
    ChatModel(name: "Sarfaraz", status: "Web Developer"),
    ChatModel(name: "Usman khan", status: "Video editior"),
    ChatModel(name: "Saad", status: "Sale Manager"),
    ChatModel(name: "Imad Raza", status: "Full Stack Developer"),
    ChatModel(name: "Sarfaraz", status: "Web Developer"),
    ChatModel(name: "Usman khan", status: "Video editior"),
    ChatModel(name: "Saad", status: "Sale Manager"),
  ];
  List<ChatModel> groups = [];
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
                "New Group",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Add Participants",
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 26,
                )),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contact.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    height: groups.length > 0 ? 90 : 10,
                  );
                }
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (contact[index - 1].select == true) {
                        groups.remove(contact[index - 1]);
                        contact[index - 1].select = false;
                      } else {
                        groups.add(contact[index - 1]);
                        contact[index - 1].select = true;
                      }
                    });
                  },
                  child: ContactCart(
                    contact: contact[index - 1],
                  ),
                );
              },
            ),
            groups.isNotEmpty
                ? Column(
                    children: [
                      Container(
                        height: 75,
                        color: Colors.white,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: groups.length,
                            itemBuilder: (context, index) {
                              if (contact[index].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contact[index]);
                                      contact[index].select = false;
                                    });
                                  },
                                  child: AvatarCart(
                                    contact: contact[index],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      const Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ));
  }
}
