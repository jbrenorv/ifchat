import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/modules/home/components/daily_limit_likes_widget.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/if.dart';
import 'package:ifchat/app/shared/models/user_model.dart';

import '../../components/appbar_widget.dart';
import '../../components/user_card_widget.dart';
import 'feed_controller.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key? key}) : super(key: key);

  final controller = FeedController();

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  // int _stackIndex = 1;

  @override
  void initState() {
    super.initState();

    widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(title: 'iFChat'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (_) {
          return Stack(
            children: [
              const DailyLimitLikesWidget(),
              ...List.generate(
                widget.controller.users.length,
                (index) => UserCardWidget(
                  user: widget.controller.users[index],
                  onLeave: widget.controller.next,
                  onLike: () {},
                  onReject: () {},
                  inFocus: widget.controller.inFocus(index),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
