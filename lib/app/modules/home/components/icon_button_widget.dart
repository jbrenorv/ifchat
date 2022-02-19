import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.color = AppColors.ifGray,
    this.iconSize = 25,
  }) : super(key: key);

  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: AppColors.ifWhite,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: AppColors.ifGray, blurRadius: .5)],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: const CircleBorder(),
          child: Icon(
            icon,
            color: color,
            size: iconSize,
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
