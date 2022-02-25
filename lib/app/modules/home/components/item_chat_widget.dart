import 'package:flutter/material.dart';
import 'package:ifchat/app/modules/home/models/chat_model.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/icons/app_icons.dart';

class ItemChatWidget extends StatelessWidget {
  const ItemChatWidget({Key? key, required this.chat}) : super(key: key);

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
              dimension: 60,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(chat.user.photos.first),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.user.name,
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.ifDarkGrenn,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    chat.lastMessage.content,
                    overflow: TextOverflow.ellipsis,
                    style: chat.lastMessage.visualized
                        ? const TextStyle(
                            fontSize: 14,
                            color: AppColors.ifGraySubtitle,
                            fontWeight: FontWeight.w300,
                          )
                        : const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                  ),
                ],
              ),
            ),
            if (!chat.lastMessage.visualized)
              const Icon(
                AppIcons.point,
                color: AppColors.ifDarkGrenn,
                size: 10,
              ),
          ],
        ),
      ),
      onTap: () {},
    );

    // return ListTile(
    //   leading: CircleAvatar(
    //     radius: 30,
    //     backgroundImage: NetworkImage(chat.user.photoUrl),
    //   ),
    //   title: Text(chat.user.name),
    //   subtitle: Text(chat.lastMessage.content),
    //   onTap: () {},
    // );
  }
}
