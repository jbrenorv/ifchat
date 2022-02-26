import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:ifchat/app/shared/enums/gender.dart';
import 'package:ifchat/app/shared/enums/orientation.dart' as o;
import 'package:ifchat/app/shared/interfaces/i_auth_service.dart';
import 'package:ifchat/app/shared/interfaces/i_database_service.dart';
import 'package:ifchat/app/shared/interfaces/i_storage_service.dart';
import 'package:ifchat/app/shared/models/picked_image_model.dart';
import 'package:ifchat/app/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  final List<Campus> campus = <Campus>[Campus.fortaleza];
  final List<Degree> degrees = Degree.values;
  final List<Gender> genders = Gender.values;
  final List<o.Orientation> orientations = o.Orientation.values;

  final inputNameController = TextEditingController(text: 'João Breno');
  final inputEmailController =
      TextEditingController(text: 'joao.breno@aluno.ifce.edu.br');
  final inputPasswordController = TextEditingController(text: '12345678');
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

  ObservableList<PickedImageModel> photos = <PickedImageModel>[].asObservable();
  @action
  void removeImage(PickedImageModel v) => photos.remove(v);
  @action
  void addImage(PickedImageModel v) => photos.add(v);
  @computed
  bool get done => photos.isNotEmpty && !isLoading;
  @computed
  bool get canAddAnotherImage => photos.length < 3 && !isLoading;

  @observable
  bool isLoading = false;
  @action
  void _setLoading(bool v) => isLoading = v;

  Future<String?> registerUser() async {
    _setLoading(true);

    // if result != null --> ERROR --> reverse all operations
    String? result;

    // services
    final auth = Modular.get<IAuthService>();
    final storage = Modular.get<IStorageService>();
    final db = Modular.get<IDatabaseService>();

    // register user
    final authResponse = await auth.createUserWithEmailAndPassword(
      email: inputEmailController.text,
      password: inputPasswordController.text,
    );

    if (!authResponse.hasError) {
      final uid = authResponse.value!;
      final urls = <String>[];
      int photoId = 0;
      bool uploaded = true;

      // save user photos
      for (PickedImageModel photo in photos) {
        final uploadResponse = await storage.saveUserPhoto(
          uid,
          'photo_$photoId.${photo.extendion}',
          photo.data,
        );
        photoId++;

        if (!uploadResponse.hasError) {
          urls.add(uploadResponse.value!);
        } else {
          result = uploadResponse.message;
          uploaded = false;
          break;
        }
      }

      if (uploaded) {
        final user = UserModel(
          course: selectedCourse,
          name: inputNameController.text,
          photos: urls,
          id: uid,
          birth: birth!,
          degree: selectedDegree,
          campus: selectedCampus,
          gender: selectedGender,
          orientation: selectedOrientation,
        );

        // save user data
        final dbResponse = await db.createUser(user);
        result = dbResponse.message;
      }
    } else {
      result = authResponse.message;
    }

    _setLoading(false);
    return result;
  }

  Future<void> reverse() async {
    // services
    final auth = Modular.get<IAuthService>();
    final storage = Modular.get<IStorageService>();
    final db = Modular.get<IDatabaseService>();

    await db.deleteUser(auth.uid);
    await storage.deleteUserPhotos(auth.uid);
    await auth.deleteUserAccount();
  }
}
