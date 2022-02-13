import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/if.dart';
import 'package:ifchat/app/shared/models/user_model.dart';

import '../../components/appbar_widget.dart';
import '../../components/user_card_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    final user = UserModel(
      course: 'Computação',
      name: 'Eloise',
      photoUrl: 'https://picsum.photos/id/832/300/400',
      id: 'fg5g44g65dg4b4',
      age: 21,
      degree: Degree.sup,
      ifce: If.fortaleza,
    );

    return Scaffold(
      appBar: const AppBarWidget(title: 'iFChat'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: UserCardWidget(user: user),
      ),
    );
  }
}
