import 'package:ifchat/app/shared/enums/degree.dart';

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

  Map<Degree, List<String>> get courses {
    switch (this) {
      case If.fortaleza:
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
