import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ifchat/app/modules/home/components/appbar_widget.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final key = GlobalKey();
  double _stakCenterY = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      // lowerBound: 0.0,
      // upperBound: 2.0,
      duration: const Duration(seconds: 5),
    );

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _stakCenterY = _centerY();
      _controller.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _centerY() => key.currentContext!.size!.height / 2;

  @override
  Widget build(BuildContext context) {
    final Widget alvo = Center(
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );

    const Size size = Size(200, 200);

    return Scaffold(
      appBar: const AppBarWidget(title: 'Profile'),
      body: Stack(
        key: key,
        alignment: AlignmentDirectional.topCenter,
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.pink,
              child: alvo,
            ),
            builder: (_, widget) {
              return Transform(
                origin: Offset(size.width / 2, size.height / 2),
                transform: Matrix4.columns(
                  vector.Vector4(1, 0, 0, 0),
                  vector.Vector4(0, 1, 0, 0),
                  vector.Vector4(0, 0, 1, 0),
                  vector.Vector4(0, 0, 0, 1),

                  // 1,0,0,0,
                  // 0,1,0,0,
                  // 0,0,1,0,
                  // 0,0,0,1,
                )
                  ..translate(vector.Vector3(0, -size.height, 0))
                  ..translate(vector.Vector3(0,
                      _controller.value * (_stakCenterY + size.height / 2), 0)),

                // ..rotateZ(math.acos(1 - _controller.value)),
                child: widget,
              );
            },
          ),
          Center(
            child: Container(
              height: size.height,
              width: size.width,
              color: Colors.black.withOpacity(.4),
              child: alvo,
            ),
          ),
          alvo,
        ],
      ),
    );
  }
}
