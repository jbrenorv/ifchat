import 'package:flutter/material.dart';
import 'package:ifchat/app/modules/home/components/physics_card_drag_widget.dart';

import '../../components/appbar_widget.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: 'Chats'),
      body: PhysicsCardDragDemo(),
    );
  }
}
