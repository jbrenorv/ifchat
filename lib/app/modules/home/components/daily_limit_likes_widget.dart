import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';

class DailyLimitLikesWidget extends StatelessWidget {
  const DailyLimitLikesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Você atingiu o limite diário de interações.',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.ifGray,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
