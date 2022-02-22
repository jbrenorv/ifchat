import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';

class RoundedGrayContainerWidget extends StatelessWidget {
  const RoundedGrayContainerWidget({
    Key? key,
    this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0),
  }) : super(key: key);

  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.ifGrayBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
