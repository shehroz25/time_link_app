import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_link_shehroz/chat_module/view/search_user.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';

class ChatRoom extends StatelessWidget {
  ChatRoom({Key? key, this.userMap, this.chatRoomId}) : super(key: key);
  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Map<String, dynamic>? userMap;
  final String? chatRoomId;

  void onSendMessage() async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": _auth.currentUser!.displayName,
        "message": _message.text,
        //"type": "text",
        "time": FieldValue.serverTimestamp(),
      };

      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      print("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: (userMap!['business name']),
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const SearchUser()),
            );
          },
          icon: Icons.arrow_back_ios,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xffF9FCFF)),
                height: size.height * .83,
                width: size.width,
                child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection('chatroom')
                      .doc(chatRoomId)
                      .collection('chats')
                      .orderBy("time", descending: false)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.data != null) {
                      return ListView.builder(
                        //reverse: true,
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.only(
                                left: 14, right: 14, top: 10, bottom: 10),
                            child: Align(
                              alignment: (snapshot.data!.docs[index]
                                          ['message'] ==
                                      "receiver"
                                  ? Alignment.topLeft
                                  : Alignment.topRight),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: (snapshot.data!.docs[index]
                                              ['message'] ==
                                          "receiver"
                                      ? Colors.grey.shade200
                                      : const Color(0xff7676801f)),
                                ),
                                padding: const EdgeInsets.all(14),
                                child: Text(
                                  snapshot.data!.docs[index]['message'],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Container(
                height: size.height / 20,
                width: size.width,
                decoration: const BoxDecoration(color: Color(0xffEFEFEF)),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    const SizedBox(width: 13),
                    const Icon(
                      Icons.add,
                      color: Color(0xff007AFF),
                    ),
                    const SizedBox(width: 13),
                    SizedBox(
                      height: size.height / 12,
                      width: size.width / 2,
                      child: TextField(
                        controller: _message,
                        decoration: InputDecoration(
                            //fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8))),
                      ),
                    ),
                    IconButton(
                        color: const Color(0xff007AFF),
                        onPressed: () {
                          onSendMessage();
                        },
                        icon: const Icon(Icons.send)),
                    IconButton(
                        color: const Color(0xff007AFF),
                        onPressed: () {
                          //onSendMessage();
                        },
                        icon: const Icon(Icons.camera_alt_outlined)),
                    IconButton(
                        color: const Color(0xff007AFF),
                        onPressed: () {
                          //onSendMessage();
                        },
                        icon: const Icon(Icons.mic)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
