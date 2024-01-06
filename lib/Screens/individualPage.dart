import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:whatsapp/model/chat_model.dart';

class IndividualPage extends StatefulWidget {
  final ChatModel chatModel;
  const IndividualPage({super.key, required this.chatModel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90.0,
        leading: InkWell(
          onTap: () {},
          child: Row(
            children: [
              const SizedBox(
                width: 1,
              ),
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 24,
                ),
              ),
              const SizedBox(
                width: 0.1,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey,
                child: SvgPicture.asset(
                  widget.chatModel.isGroup
                      ? "assets/group.svg"
                      : "assets/person.svg",
                  color: Colors.white,
                  height: 45,
                  width: 45,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFF075E54),
        title: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chatModel.name,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const Text(
                "last seen today at 12:52",
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
              onSelected: (value) {},
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem(
                    child: Text("View Contact"),
                    value: "View Contact",
                  ),
                  const PopupMenuItem(
                    child: Text("Media, Link, Docs"),
                    value: "Media, Link, Docs",
                  ),
                  const PopupMenuItem(
                    child: Text("Whatsapp Web"),
                    value: "Whatsapp Web",
                  ),
                  const PopupMenuItem(
                    child: Text("Search"),
                    value: "Search",
                  ),
                  const PopupMenuItem(
                    child: Text("Mute Notification"),
                    value: "Mute Notification",
                  ),
                  const PopupMenuItem(
                    child: Text("Wallpaper"),
                    value: "Wallpaper",
                  ),
                ];
              }),
        ],
      ),

      // end of app bar
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 55,
                    child: Card(
                      margin:
                          const EdgeInsets.only(left: 2, right: 2, bottom: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(225),
                      ),
                      child: TextFormField(
                        controller: _controller,
                        textAlignVertical: TextAlignVertical.center,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        minLines: 1,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "type a message",
                          prefixIcon: IconButton(
                            onPressed: () {
                              emojiSelect();
                            },
                            icon: const Icon(
                              Icons.emoji_emotions,
                              color: Color(0xFF075E54),
                            ),
                          ),
                          suffixIcon:
                              Row(mainAxisSize: MainAxisSize.min, children: [
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (builder) => bottomsheet());
                              },
                              icon: const Icon(
                                Icons.attach_file,
                                color: Color(0xFF075E54),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.camera_alt,
                                color: Color(0xFF075E54),
                              ),
                            ),
                          ]),
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                    ),
                  ),
                  //send button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF075E54),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget bottomsheet() {
    return Container(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(18),
        child: Column(
          children: [
            const SizedBox(
              height: 22,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              iconcreation(Icons.insert_drive_file, Colors.indigo, "Document"),
              const SizedBox(
                width: 30,
              ),
              iconcreation(Icons.camera_alt, Colors.pink, "Camera"),
              const SizedBox(
                width: 30,
              ),
              iconcreation(Icons.insert_photo, Colors.purple, "Gallery"),
            ]),
            const SizedBox(
              height: 22,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              iconcreation(Icons.headset, Colors.orange, "Audio"),
              const SizedBox(
                width: 30,
              ),
              iconcreation(Icons.location_pin, Colors.teal, "location"),
              const SizedBox(
                width: 30,
              ),
              iconcreation(Icons.person, Colors.blue, "Contact"),
            ]),
          ],
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (emoji, Category) {
        _controller.text = _controller.text + emoji.toString();
      },
    );
  }
}
