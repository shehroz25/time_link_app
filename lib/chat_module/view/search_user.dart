import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_link_shehroz/chat_module/view/chat_room.dart';
import 'package:time_link_shehroz/utils/custom_appbar.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({Key? key}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  final TextEditingController _search = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Map<String, dynamic>? userMap;

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  void onSearch() async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection("users")
        .where("email", isEqualTo: _search.text)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
      });
      print(userMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            title: "Add Users",
            icon: Icons.arrow_back_ios,
            onPressed: () {
              Navigator.pop(context);
            }),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
            ),
            child: Column(
              children: [
                const SizedBox(height: 25),
                SizedBox(
                  height: size.height / 14,
                  width: size.width / 1.2,
                  child: TextFormField(
                    controller: _search,
                    decoration: InputDecoration(
                        hintText: "search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                    onPressed: () {
                      onSearch();
                    },
                    child: const Text("Search")),
                const SizedBox(
                  height: 25,
                ),
                userMap != null
                    ? ListTile(
                        onTap: () {
                          String roomId = chatRoomId(
                              _auth.currentUser!.displayName!,
                              userMap!['business name']);

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ChatRoom(
                                chatRoomId: roomId,
                                userMap: userMap!,
                              ),
                            ),
                          );
                        },
                        leading: const Icon(
                          Icons.account_box,
                          color: Colors.black,
                        ),
                        trailing: const Icon(
                          Icons.chat_bubble,
                          color: Colors.black,
                        ),
                        title: Text(userMap!['business name']),
                        subtitle: Text(userMap!["email"]),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
