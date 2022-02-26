import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/app_routes.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/components/text_input_widget.dart';
import 'package:ifchat/app/shared/images/app_images.dart';
import 'package:ifchat/app/shared/interfaces/i_auth_service.dart';

class SiginPage extends StatefulWidget {
  const SiginPage({Key? key}) : super(key: key);

  @override
  _SiginPageState createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  final _inputEmailController = TextEditingController();
  final _inputPasswordController = TextEditingController();

  void _siginUser() async {
    if (_inputEmailController.text.isEmpty ||
        _inputPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Infome email e senha')));
    } else {
      final auth = Modular.get<IAuthService>();
      final response = await auth.signInWithEmailAndPassword(
        _inputEmailController.text,
        _inputPasswordController.text,
      );

      if (!response.hasError) {
        Modular.to.pushNamedAndRemoveUntil(
          AppRoutes.home,
          (_) => false,
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response.message!)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ClipPath(
                        // clipper: CustomClipPath(),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          decoration: const BoxDecoration(
                            gradient: AppColors.ifLinearGradient,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                          ),
                          child: Image.asset(AppImages.logo, scale: 1.5),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 4),
                            child: TextInputWidget(
                              controller: _inputEmailController,
                              prefixIcon: const Icon(
                                Icons.person_outline_rounded,
                              ),
                              hintText: 'Email',
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(16.0, 4, 16.0, 30.0),
                            child: TextInputWidget(
                              controller: _inputPasswordController,
                              prefixIcon: const Icon(
                                Icons.lock_outline_rounded,
                              ),
                              hintText: 'Senha',
                              obscureText: true,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _siginUser,
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(150, 46),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: AppColors.ifWhite,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                            ),
                            child: const Text('Esqueci minha senha'),
                          ),
                          TextButton(
                            onPressed: () => Modular.to.pushNamed(
                              AppRoutes.signup,
                            ),
                            style: TextButton.styleFrom(
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                              ),
                            ),
                            child: const Text('Cadastrar-se'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
