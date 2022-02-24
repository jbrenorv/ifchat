enum Gender { masculino, feminino }

extension ToString on Gender {
  String get name {
    switch (this) {
      case Gender.masculino:
        return 'Masculino';
      case Gender.feminino:
        return 'Feminino';
    }
  }
}
