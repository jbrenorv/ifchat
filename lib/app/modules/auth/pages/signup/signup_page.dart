import 'package:flutter/material.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/components/appbar_widget.dart';

class SigupPage extends StatefulWidget {
  const SigupPage({Key? key}) : super(key: key);

  @override
  _SigupPageState createState() => _SigupPageState();
}

class _SigupPageState extends State<SigupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text(
          'Cadastrar',
          style: TextStyle(
            color: AppColors.ifWhite,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
