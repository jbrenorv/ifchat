import 'package:flutter/widgets.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:ifchat/app/shared/enums/gender.dart';
import 'package:ifchat/app/shared/enums/orientation.dart' as o;
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  final List<Campus> campus = <Campus>[Campus.fortaleza];
  final List<Degree> degrees = Degree.values;
  final List<Gender> genders = Gender.values;
  final List<o.Orientation> orientations = o.Orientation.values;

  final inputNameController = TextEditingController();
  final inputEmailController = TextEditingController();
  final inputPasswordController = TextEditingController();
  final inputBirthController = TextEditingController();

  @observable
  bool isValidName = true;
  @observable
  bool isValidEmail = true;
  @observable
  bool isValidPassword = true;
  @observable
  bool isValidBirthDate = true;

  @observable
  Gender selectedGender = Gender.masculino;
  @action
  void setSelectedGender(Gender v) => selectedGender = v;

  @observable
  o.Orientation selectedOrientation = o.Orientation.hetero;
  @action
  void setSelectedOrientation(o.Orientation v) => selectedOrientation = v;

  @observable
  Campus selectedCampus = Campus.fortaleza;
  @action
  void setSelectedCampus(Campus v) => selectedCampus = v;

  @observable
  Degree selectedDegree = Degree.sup;
  @action
  void setSelectedDegree(Degree v) {
    selectedDegree = v;
    setSelectedCourse(courses.first);
  }

  @computed
  List<String> get courses => selectedCampus.courses[selectedDegree]!;
  @observable
  String selectedCourse = Campus.fortaleza.courses[Degree.sup]!.first;
  @action
  void setSelectedCourse(String v) => selectedCourse = v;

  DateTime? birth;
  void setBirthDate(DateTime v) {
    birth = v;
    inputBirthController.text =
        '${_twoDigits(v.day)}-${_twoDigits(v.month)}-${v.year}';
  }

  String _twoDigits(int n) => n < 10 ? '0$n' : '$n';

  @action
  String? validate() {
    String? alert;

    isValidName = inputNameController.text.isNotEmpty;
    if (!isValidName) {
      alert = 'Informe seu nome';
    }
    isValidBirthDate = birth != null;
    if (!isValidBirthDate) {
      alert = 'Informe sua data de nascimento';
    }
    isValidPassword = inputPasswordController.text.length > 7;
    if (!isValidPassword) {
      alert = 'Use senha de no mínimo 8 caracteres';
    }
    if (inputEmailController.text.isNotEmpty) {
      final splitEmail = inputEmailController.text.split('@');
      if (splitEmail.length == 2) {
        isValidEmail =
            splitEmail[0].isNotEmpty && splitEmail[1] == 'aluno.ifce.edu.br';
        if (!isValidEmail) {
          isValidEmail = false;
          alert = 'Use o email institucional';
        }
      } else {
        isValidEmail = false;
        alert = 'Use o email institucional';
      }
    } else {
      isValidEmail = false;
      alert = 'Use seu email institucional';
    }

    return alert;
  }
}
