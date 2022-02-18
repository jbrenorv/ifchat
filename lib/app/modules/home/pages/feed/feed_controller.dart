import 'package:ifchat/app/shared/enums/degree.dart';
import 'package:ifchat/app/shared/enums/if.dart';
import 'package:ifchat/app/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'feed_controller.g.dart';

class FeedController = _FeedControllerBase with _$FeedController;

abstract class _FeedControllerBase with Store {
  ObservableList<UserModel> users = <UserModel>[].asObservable();

  int currentCardIndex = 0;

  int nextCardIndex = 1;

  @computed
  dynamic get next => users.isNotEmpty ? _next : null;

  @action
  void _next() => users.removeLast();

  @action
  Future<void> init() async {
    users.addAll([
      UserModel(
        course: 'Computação',
        name: 'Eloise',
        photoUrl: 'https://picsum.photos/id/832/300/400',
        id: 'fg5g44g65dg4b4',
        age: 21,
        degree: Degree.sup,
        ifce: If.fortaleza,
      ),
      UserModel(
        course: 'Matemática',
        name: 'Nagila',
        photoUrl: 'https://picsum.photos/id/65/300/400',
        id: 'fg5g44g65dg4b4',
        age: 17,
        degree: Degree.sup,
        ifce: If.fortaleza,
      ),
    ]);
    await Future.delayed(const Duration(seconds: 1));
  }

  bool inFocus(int index) => (users.length - 1) == index;
}
