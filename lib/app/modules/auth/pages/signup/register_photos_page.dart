import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/components/appbar_widget.dart';

class RegisterPhotosPage extends StatefulWidget {
  const RegisterPhotosPage({Key? key}) : super(key: key);

  @override
  _RegisterPhotosPageState createState() => _RegisterPhotosPageState();
}

class _RegisterPhotosPageState extends State<RegisterPhotosPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: Text(
          'Cadastrar',
          style: TextStyle(
            color: AppColors.ifWhite,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
