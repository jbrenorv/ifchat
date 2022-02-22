enum Degree { int, sub, sup }

extension ToString on Degree {
  String get sigla {
    switch (this) {
      case Degree.int:
        return 'INT';
      case Degree.sub:
        return 'SUB';
      case Degree.sup:
        return 'SUP';
    }
  }

  String get name {
    switch (this) {
      case Degree.int:
        return 'Integrado';
      case Degree.sub:
        return 'Subsequente';
      case Degree.sup:
        return 'Superior';
    }
  }
}
