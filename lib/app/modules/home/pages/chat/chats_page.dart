import 'package:flutter/material.dart';
import 'package:ifchat/app/modules/home/components/item_chat_widget.dart';
import 'package:ifchat/app/modules/home/components/search_input_widget.dart';
import 'package:ifchat/app/modules/home/models/chat_model.dart';
import 'package:ifchat/app/modules/home/models/message_model.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/if.dart';
import 'package:ifchat/app/shared/models/user_model.dart';

import '../../../../shared/components/appbar_widget.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final chats = <ChatModel>[
    ChatModel(
      user: UserModel(
        course: 'Computação',
        name: 'Eloise',
        photoUrl: 'https://picsum.photos/id/832/300/400',
        id: 'fg5g44g65dg4b4',
        age: 21,
        degree: Degree.sup,
        ifce: If.fortaleza,
      ),
      lastMessage: MessageModel(
        content: 'Flying to Italy on 24th of this month.',
        visualized: false,
      ),
    ),
    ChatModel(
      user: UserModel(
        course: 'Matemática',
        name: 'Nagila',
        photoUrl: 'https://picsum.photos/id/65/300/400',
        id: 'fg5g44g65dg4b4',
        age: 17,
        degree: Degree.sup,
        ifce: If.fortaleza,
      ),
      lastMessage: MessageModel(
        content: 'Sure thing!',
        visualized: true,
      ),
    ),
  ];

  final _itemChatHeight = 100.0;

  double get _listViewHeight => _itemChatHeight * chats.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ifWhite,
      appBar: const AppBarWidget(
        title: Text(
          'Chats',
          style: TextStyle(
            color: AppColors.ifWhite,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              child: SearchInputWidget(),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Text(
                'Mensagens (3)',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: AppColors.ifDarkGrenn,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: _listViewHeight),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemExtent: _itemChatHeight,
                itemCount: chats.length,
                itemBuilder: (_, index) {
                  return ItemChatWidget(chat: chats[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
