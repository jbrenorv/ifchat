import 'package:ifchat/app/shared/enums/degree.dart';

enum Campus {
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

extension ToString on Campus {
  String get name {
    switch (this) {
      case Campus.acarau:
        return 'Acaraú';
      case Campus.aracati:
        return 'Aracati';
      case Campus.baturite:
        return 'Baturité';
      case Campus.camocim:
        return 'Camocim';
      case Campus.caninde:
        return 'Canindé';
      case Campus.caucaia:
        return 'Caucaia';
      case Campus.cedro:
        return 'Cedro';
      case Campus.crateus:
        return 'Crateus';
      case Campus.crato:
        return 'Crato';
      case Campus.fortaleza:
        return 'Fortaleza';
      case Campus.iguatu:
        return 'Iguatu';
      case Campus.jaguaribe:
        return 'Jaguaribe';
      case Campus.juazeiro:
        return 'Juazeiro';
      case Campus.limoeiro:
        return 'Limoeiro';
      case Campus.maracanau:
        return 'Maracanaú';
      case Campus.morada:
        return 'Morada';
      case Campus.quixada:
        return 'Quixadá';
      case Campus.sobral:
        return 'Sobral';
      case Campus.tabuleiro:
        return 'Tabuleiro';
      case Campus.taua:
        return 'Tauá';
      case Campus.tiangua:
        return 'Tianguá';
      case Campus.ubajara:
        return 'Ubajara';
      case Campus.umirim:
        return 'Umirim';
    }
  }

  Map<Degree, List<String>> get courses {
    switch (this) {
      case Campus.fortaleza:
        return {
          Degree.sup: [
            // tecnologos
            'Estradas',
            'Gestão Ambiental',
            'Gestão Desportiva e de Lazer',
            'Hotelaria',
            'Mecatrônica Industrial',
            'Processos Químicos',
            'Saneamento Ambiental',
            'Telemática',

            // licenciatura
            'Artes Visuais',
            'Física',
            'Matemática',
            'Teatro',

            // bacharelados
            'Engenharia Civil',
            'Engenharia da Computação',
            'Engenharia de Mecatrônica',
            'Engenharia de Telecomunicações',
            'Turismo',
          ],
          Degree.int: [
            // integrado
            'Edificações',
            'Eletrotécnica',
            'Informática',
            'Mecânica',
            'Química',
            'Telecomunicações',
          ],
          Degree.sub: [
            // subsequente
            'Edificações',
            'Eletrotécnica',
            'Guia de Turismo',
            'Instrumento Musical',
            'Manutenção Automotiva',
            'Mecânica Industrial',
            'Segurança do Trabalho',
          ],
        };

      default:
        return {
          Degree.sup: [],
          Degree.int: [],
          Degree.sub: [],
        };
    }
  }
}
