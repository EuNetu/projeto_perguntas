import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final String texto = 'Deseja reniciar?';
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  Resultado(this.pontuacao, this.reiniciarQuestionario);

  String get fraseResultado {
    if (pontuacao == 0) {
      return 'No mínimo, não sabe nem meu nome';
    } else if (pontuacao < 8) {
      return 'Horrível';
    } else if (pontuacao < 20) {
      return 'me conhece pouco';
    } else if (pontuacao < 29) {
      return 'Me conhece demais';
    } else {
      return 'Vive comigo';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(color: Colors.pink.withOpacity(1.0), fontSize: 30),
          ),
        ),
        ElevatedButton(
          onPressed: reiniciarQuestionario,
          child: Text(
            texto
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            textStyle: TextStyle(fontSize: 18),
            padding: EdgeInsets.all(10)
          ),
        )
      ],
    );
  }
}
