import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/icons/app_icons.dart';
import 'package:ifchat/app/shared/models/user_model.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../../../shared/components/icon_button_widget.dart';

class UserCardWidget extends StatefulWidget {
  const UserCardWidget({
    Key? key,
    required this.user,
    required this.onLike,
    required this.onReject,
    required this.onLeave,
    required this.inFocus,
  }) : super(key: key);

  final UserModel user;
  final VoidCallback onLike;
  final VoidCallback onReject;
  final VoidCallback? onLeave;
  final bool inFocus;

  @override
  _UserCardWidgetState createState() => _UserCardWidgetState();
}

class _UserCardWidgetState extends State<UserCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final cardKey = GlobalKey();

  Offset cardOrigin = Offset.zero;
  double dx = 0.0;
  int _sense = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInBack,
    );

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      final deviceWidth = MediaQuery.of(context).size.width;
      final cardSize = cardKey.currentContext!.size!;

      dx = deviceWidth + (cardSize.width / 2);
      cardOrigin = Offset(cardSize.width / 2, cardSize.height / 2);

      setState(() {});
    });
  }

  double get translationX => _sense * dx * _animation.value;
  double get rotationZ => _sense * math.asin(_controller.value / 2);

  void animate(int sense) {
    _sense = sense;
    _controller.forward().then((_) {
      if (widget.onLeave != null) widget.onLeave!();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, child) {
        return Transform(
          origin: cardOrigin,
          transform: Matrix4.identity()
            ..translate(vector.Vector3(translationX, 0, 0))
            ..rotateZ(rotationZ),
          child: child,
        );
      },
      child: Card(
        key: cardKey,
        elevation: widget.inFocus ? 8.0 : 0.0,
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
                          '${widget.user.course}, ${widget.user.degree.sigla}'
                          ' • ${widget.user.campus.name}',
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
                    onPressed: () {
                      animate(-1);
                      widget.onReject();
                    },
                  ),
                  IconButtonWidget(
                    icon: AppIcons.heart_1,
                    color: AppColors.ifDarkGrenn,
                    onPressed: () {
                      animate(1);
                      widget.onLike();
                    },
                    iconSize: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
