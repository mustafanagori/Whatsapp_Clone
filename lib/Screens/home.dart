import 'package:flutter/material.dart';
import 'package:whatsapp/page/call.dart';
import 'package:whatsapp/page/camera.dart';
import 'package:whatsapp/page/chart.dart';
import 'package:whatsapp/page/status.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF075E54),
        title: const Text(
          "Whatsapp",
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
              )),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       Icons.more_vert_rounded,
          //     )),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("New group"),
                    value: "New group",
                  ),
                  const PopupMenuItem(
                    child: Text("New broadcast"),
                    value: "New broadcast",
                  ),
                  const PopupMenuItem(
                    child: Text("Whatsapp Web"),
                    value: "Whatsapp Web",
                  ),
                  const PopupMenuItem(
                    child: Text("Starred message"),
                    value: "Starred message",
                  ),
                  const PopupMenuItem(
                    child: Text("Setting"),
                    value: "Setting",
                  ),
                ];
              }),
        ],
        bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _controller,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: const [
          CameraPage(),
          ChatPage(),
          StatusPage(),
          CallPage(),
        ],
      ),
    );
  }
}
