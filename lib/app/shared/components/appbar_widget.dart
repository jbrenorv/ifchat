import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);

  @override
  final preferredSize = const Size.fromHeight(110);

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        gradient: AppColors.ifLinearGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: title,
    );
  }
}
