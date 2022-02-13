import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/icons/app_icons.dart';
import 'package:ifchat/app/shared/models/user_model.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/if.dart';

import 'icon_button_widget.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  _UserCardWidgetState createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.user.photoUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  color: Colors.black.withOpacity(.5),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.user.name}, ${widget.user.age}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ifWhite,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${widget.user.course}, ${widget.user.degree.name}'
                        ' • ${widget.user.ifce.name}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.ifWhiteSubtitle,
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButtonWidget(
                  icon: AppIcons.reject,
                  color: AppColors.ifRed,
                  onPressed: () {},
                ),
                IconButtonWidget(
                  icon: AppIcons.heart_1,
                  color: AppColors.ifGrenn,
                  onPressed: () {},
                  iconSize: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
