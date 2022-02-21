import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ifchat/app/modules/home/components/daily_limit_likes_widget.dart';
import 'package:ifchat/app/modules/home/components/loading_widget.dart';
import 'package:ifchat/app/shared/images/app_images.dart';

import '../../../../shared/components/appbar_widget.dart';
import '../../components/user_card_widget.dart';
import 'feed_controller.dart';

class FeedPage extends StatefulWidget {
  FeedPage({Key? key}) : super(key: key);

  final controller = FeedController();

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  void initState() {
    super.initState();

    if (!widget.controller.isInit) widget.controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: Image.asset(
            AppImages.logo,
            scale: 2.75,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Observer(builder: (_) {
          return Stack(
            children: [
              if (!widget.controller.isInit)
                const LoadingWidget()
              else
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
