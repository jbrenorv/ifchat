import 'dart:convert';

import 'package:ifchat/app/modules/home/models/message_model.dart';
import 'package:ifchat/app/shared/models/user_model.dart';

class ChatModel {
  final UserModel user;
  final MessageModel lastMessage;

  ChatModel({
    required this.user,
    required this.lastMessage,
  });

  ChatModel copyWith({
    UserModel? user,
    MessageModel? lastMessage,
  }) {
    return ChatModel(
      user: user ?? this.user,
      lastMessage: lastMessage ?? this.lastMessage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': user.toMap(),
      'lastMessage': lastMessage.toMap(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      user: UserModel.fromMap(map['user']),
      lastMessage: MessageModel.fromMap(map['lastMessage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() => 'ChatModel(user: $user, lastMessage: $lastMessage)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatModel &&
        other.user == user &&
        other.lastMessage == lastMessage;
  }

  @override
  int get hashCode => user.hashCode ^ lastMessage.hashCode;
}
