import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/icons/app_icons.dart';

import 'pages/chat/chat_page.dart';
import 'pages/feed/feed_page.dart';
import 'pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = <Widget>[
    FeedPage(),
    const ChatsPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: Colors.black26,
          ),
          padding: const EdgeInsets.only(top: 1),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.ifWhite,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const TabBar(
              labelColor: AppColors.ifDarkGrenn,
              unselectedLabelColor: AppColors.ifGray,
              padding: EdgeInsets.all(4),
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: AppColors.ifDarkGrenn,
              tabs: [
                Tab(icon: Icon(AppIcons.home)),
                Tab(icon: Icon(AppIcons.chat)),
                Tab(icon: Icon(AppIcons.profile)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
