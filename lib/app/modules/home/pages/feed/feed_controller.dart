import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/campus.dart';
import 'package:ifchat/app/shared/enums/gender.dart';
import 'package:ifchat/app/shared/enums/orientation.dart' as o;
import 'package:ifchat/app/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  ObservableList<UserModel> users = <UserModel>[].asObservable();

  bool isInit = false;

  @computed
  dynamic get next => users.isNotEmpty ? _next : null;

  @action
  void _next() => users.removeLast();

  @action
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));
    users.addAll([
      UserModel(
        course: 'Computação',
        name: 'Eloise',
        photos: ['https://picsum.photos/id/832/300/400'],
        id: 'fg5g44g65dg4b4',
        birth: DateTime(2000),
        degree: Degree.sup,
        campus: Campus.fortaleza,
        gender: Gender.feminino,
        orientation: o.Orientation.hetero,
      ),
      UserModel(
        course: 'Matemática',
        name: 'Nagila',
        photos: ['https://picsum.photos/id/65/300/400'],
        id: 'fg5g44g65dg4b4',
        birth: DateTime(2004),
        degree: Degree.sup,
        campus: Campus.fortaleza,
        gender: Gender.feminino,
        orientation: o.Orientation.hetero,
      ),
    ]);
    isInit = true;
  }

  bool inFocus(int index) => (users.length - 1) == index;
}
