import 'dart:math';

import 'package:flutter/material.dart';
import 'package:ifchat/app/modules/home/models/chat_model.dart';

class ItemChatWidget extends StatelessWidget {
  const ItemChatWidget({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    final r = Random().nextInt(255);
    final g = Random().nextInt(255);
    final b = Random().nextInt(255);

    return Container(
      height: 100,
      color: Color.fromRGBO(r, g, b, 1),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(chat.user.photoUrl),
        ),
        title: Text(chat.user.name),
        subtitle: Text(chat.lastMessage.content),
      ),
    );
  }
}
