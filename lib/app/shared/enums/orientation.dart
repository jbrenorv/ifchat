enum Orientation { hetero, homo, bi }

extension ToString on Orientation {
  String get name {
    switch (this) {
      case Orientation.hetero:
        return 'Hétero';
      case Orientation.homo:
        return 'Homo';
      case Orientation.bi:
        return 'Bi';
    }
  }
}
