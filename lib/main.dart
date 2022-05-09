import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

main() => runApp(new PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario(){
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  final _perguntas = const [
    {
      'texto': 'Qual curso eu faço? ',
      'resposta': [
        {'texto': 'Tecnologia da Informação', 'pontuacao': 0},
        {'texto': 'Análise e Tecnologia da Informação', 'pontuacao': 4},
        {'texto': 'Análise e Desenvolvimento de Sistemas', 'pontuacao': 10},
        {'texto': 'Análise de Sistemas', 'pontuacao': 7}
      ],
    },
    {
      'texto': 'Qual foi meu primeiro vídeo game? ',
      'resposta': [
        {'texto': 'Xbox 360', 'pontuacao': 4},
        {'texto': 'PlayStation 2', 'pontuacao': 7},
        {'texto': 'PoliStation', 'pontuacao': 10},
        {'texto': 'Nitendo (Game Boy Advance)', 'pontuacao': 0},
      ],
    },
    {
      'texto': 'Com quantos anos eu passei para faculdade? ',
      'resposta': [
        {'texto': '17', 'pontuacao': 10},
        {'texto': '18', 'pontuacao': 7},
        {'texto': '19', 'pontuacao': 4},
        {'texto': '20', 'pontuacao': 0},
      ],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _perguntas,
                perguntaSelecionada: _perguntaSelecionada,
                quandoResponder: _responder)
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
