import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/app_routes.dart';
import 'package:ifchat/app/modules/auth/pages/signup/signup_controller.dart';
import 'package:ifchat/app/shared/colors/app_colors.dart';
import 'package:ifchat/app/shared/components/appbar_widget.dart';
import 'package:ifchat/app/shared/components/rounded_gray_container_widget.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:ifchat/app/shared/enums/gender.dart';
import 'package:ifchat/app/shared/enums/orientation.dart' as o;

class SigupPage extends StatefulWidget {
  const SigupPage({Key? key}) : super(key: key);

  @override
  _SigupPageState createState() => _SigupPageState();
}

class _SigupPageState extends State<SigupPage> {
  final controller = Modular.get<SignupController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Observer(
            builder: (_) {
              return Column(
                children: [
                  const SizedBox(height: 16.0),
                  _buildInputWidget(
                    labelText: 'Nome',
                    isValid: controller.isValidName,
                    inputController: controller.inputNameController,
                    keyboardType: TextInputType.name,
                  ),
                  _buildInputWidget(
                    labelText: 'Email',
                    isValid: controller.isValidEmail,
                    inputController: controller.inputEmailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  _buildInputWidget(
                    labelText: 'Senha',
                    isValid: controller.isValidPassword,
                    inputController: controller.inputPasswordController,
                    obscureText: true,
                  ),
                  GestureDetector(
                    child: _buildInputWidget(
                      labelText: 'Data de nascimento',
                      isValid: controller.isValidBirthDate,
                      inputController: controller.inputBirthController,
                      suffixIcon: const Icon(Icons.calendar_today_outlined),
                      enabled: false,
                    ),
                    onTap: () async {
                      final birth = await showDatePicker(
                        context: context,
                        // 18 anos atras
                        initialDate:
                            DateTime.now().subtract(const Duration(days: 6570)),
                        // 30 anos atras
                        firstDate: DateTime.now()
                            .subtract(const Duration(days: 10950)),
                        // 15 anos atras
                        lastDate:
                            DateTime.now().subtract(const Duration(days: 5475)),
                      );

                      if (birth != null) {
                        controller.setBirthDate(birth);
                      }
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Campus',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ifGraySubtitle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RoundedGrayContainerWidget(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Campus>(
                                isExpanded: true,
                                items: controller.campus
                                    .map((v) => DropdownMenuItem<Campus>(
                                          child: Text(v.name),
                                          value: v,
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    controller.setSelectedCampus(v!),
                                value: controller.selectedCampus,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Nível',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ifGraySubtitle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RoundedGrayContainerWidget(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Degree>(
                                isExpanded: true,
                                items: controller.degrees
                                    .map((v) => DropdownMenuItem<Degree>(
                                          child: Text(v.name),
                                          value: v,
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    controller.setSelectedDegree(v!),
                                value: controller.selectedDegree,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Curso',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ifGraySubtitle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RoundedGrayContainerWidget(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                items: controller.courses
                                    .map((v) => DropdownMenuItem<String>(
                                          child: Text(v),
                                          value: v,
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    controller.setSelectedCourse(v!),
                                value: controller.selectedCourse,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Gênero',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ifGraySubtitle,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: RoundedGrayContainerWidget(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Gender>(
                                isExpanded: true,
                                items: controller.genders
                                    .map((v) => DropdownMenuItem<Gender>(
                                          child: Text(v.name),
                                          value: v,
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    controller.setSelectedGender(v!),
                                value: controller.selectedGender,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Orientação',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.ifGraySubtitle,
                          ),
                        ),
                        IconButton(
                          splashRadius: 20,
                          icon: const Icon(Icons.help_outline_rounded),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) {
                                return SimpleDialog(
                                  title: const Text(
                                    'Você verá pessoas com a mesma orientação sexual que a sua e do mesmo gênero caso sua orientação seja homossexual, do gênero oposto caso sua orientação seja héterossexual ou de ambos os gêneros caso sua orientação seja bissexual.',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(),
                                  ),
                                  children: [
                                    Align(
                                      child: TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: const Text('Entendi'),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: RoundedGrayContainerWidget(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<o.Orientation>(
                                isExpanded: true,
                                items: controller.orientations
                                    .map((v) => DropdownMenuItem<o.Orientation>(
                                          child: Text(v.name),
                                          value: v,
                                        ))
                                    .toList(),
                                onChanged: (v) =>
                                    controller.setSelectedOrientation(v!),
                                value: controller.selectedOrientation,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.ifMaterialGreenColor,
        label: const Text(
          'Próxima',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.ifWhite,
          ),
        ),
        icon: const Icon(
          Icons.arrow_forward_rounded,
          color: AppColors.ifWhite,
        ),
        onPressed: () {
          final result = controller.validate();
          if (result != null) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(result)));
          } else {
            Modular.to.pushNamed(AppRoutes.signupRegisterPhotos);
          }
        },
      ),
    );
  }

  Widget _buildInputWidget({
    required String labelText,
    required bool isValid,
    required TextEditingController inputController,
    Widget? suffixIcon,
    bool enabled = true,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(
            color: isValid ? AppColors.ifGrayBackground : AppColors.ifRed));

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: inputController,
        enabled: enabled,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: border,
          disabledBorder: border,
          fillColor: AppColors.ifGrayBackground,
          border: const OutlineInputBorder(),
          labelText: labelText,
          isDense: true,
          filled: true,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
