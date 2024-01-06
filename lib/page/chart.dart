import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:whatsapp/Screens/selectContact.dart';
import 'package:whatsapp/cutomerUI/custumerCart.dart';
import 'package:whatsapp/model/chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: "Muhammad",
      icon: "person.svg",
      isGroup: false,
      time: "4:56",
      currentMessage: "Assalam Walikum muhammad",
    ),
    ChatModel(
      name: "Raza",
      icon: "group.svg",
      isGroup: false,
      time: "8:45",
      currentMessage: "Assalam Walikum Raza",
    ),
    ChatModel(
      name: "Yasir",
      icon: "person.svg",
      isGroup: false,
      time: "7:42",
      currentMessage: "let me check first ",
    ),
    ChatModel(
      name: "Hamza",
      icon: "person.svg",
      isGroup: false,
      time: "10:45",
      currentMessage: "i will be there",
    ),
    ChatModel(
      name: "Usama",
      icon: "person.svg",
      isGroup: false,
      time: "9:02",
      currentMessage: "i will come at 23",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF075E54),
          onPressed: () {
            Get.to(SelectContact());
          },
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) =>
                CustomerCard(chatmodel: chats[index])));
  }
}
