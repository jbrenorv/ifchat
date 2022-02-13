enum If {
  acarau,
  aracati,
  baturite,
  camocim,
  caninde,
  caucaia,
  cedro,
  crateus,
  crato,
  fortaleza,
  iguatu,
  jaguaribe,
  juazeiro,
  limoeiro,
  maracanau,
  morada,
  quixada,
  sobral,
  tabuleiro,
  taua,
  tiangua,
  ubajara,
  umirim,
}

extension ToString on If {
  String get name {
    switch (this) {
      case If.acarau:
        return 'Acaraú';
      case If.aracati:
        return 'Aracati';
      case If.baturite:
        return 'Baturité';
      case If.camocim:
        return 'Camocim';
      case If.caninde:
        return 'Canindé';
      case If.caucaia:
        return 'Caucaia';
      case If.cedro:
        return 'Cedro';
      case If.crateus:
        return 'Crateus';
      case If.crato:
        return 'Crato';
      case If.fortaleza:
        return 'Fortaleza';
      case If.iguatu:
        return 'Iguatu';
      case If.jaguaribe:
        return 'Jaguaribe';
      case If.juazeiro:
        return 'Juazeiro';
      case If.limoeiro:
        return 'Limoeiro';
      case If.maracanau:
        return 'Maracanaú';
      case If.morada:
        return 'Morada';
      case If.quixada:
        return 'Quixadá';
      case If.sobral:
        return 'Sobral';
      case If.tabuleiro:
        return 'Tabuleiro';
      case If.taua:
        return 'Tauá';
      case If.tiangua:
        return 'Tianguá';
      case If.ubajara:
        return 'Ubajara';
      case If.umirim:
        return 'Umirim';
    }
  }
}
