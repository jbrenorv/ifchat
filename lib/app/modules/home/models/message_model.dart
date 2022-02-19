import 'dart:convert';

class MessageModel {
  final String content;
  final bool visualized;

  MessageModel({
    required this.content,
    required this.visualized,
  });

  MessageModel copyWith({
    String? content,
    bool? visualized,
  }) {
    return MessageModel(
      content: content ?? this.content,
      visualized: visualized ?? this.visualized,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'visualized': visualized,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      content: map['content'] ?? '',
      visualized: map['visualized'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessageModel(content: $content, visualized: $visualized)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.content == content &&
        other.visualized == visualized;
  }

  @override
  int get hashCode => content.hashCode ^ visualized.hashCode;
}
