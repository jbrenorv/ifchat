import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/icons/app_icons.dart';

class SearchInputWidget extends StatelessWidget {
  const SearchInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.ifGrayBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Buscar',
          prefixIcon: Icon(AppIcons.search),
        ),
      ),
    );
  }
}
