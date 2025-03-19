import 'package:flutter/material.dart';
import 'dart:math';
import 'package:jogo/main.dart';
import 'package:jogo/tela_inicial.dart';

class Jogo extends StatefulWidget {
  const Jogo({super.key});

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage('assets/imagem/padrao.png')!;
  var _mensagem = 'Escolha sua opção abaixo';

  final Map<String, AssetImage> _opcaoImagem = {
    "pedra" : AssetImage("assets/imagem/pedra.png"),
    "papel" : AssetImage("assets/imagem/papel.png"),
    "tesoura" : AssetImage("assets/imagem/tesoura.png")
  };

  void _opcaoSelecionada(String escolhaUsuario) {
    final opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    setState(() {
      this._imagemApp = _opcaoImagem[escolhaApp]!;

      if(
      (escolhaUsuario == "pedra" && escolhaApp == "tesoura") || (escolhaUsuario == "tesoura" && escolhaApp == "papel") || (escolhaUsuario == "papel" && escolhaApp == "pedra")
      ) {
        setState(() {
          this._mensagem = "Parabéns!!! Você ganhou";
        });
      } else if(
      (escolhaApp == "pedra" && escolhaUsuario == "tesoura") || (escolhaUsuario == "tesoura" && escolhaApp == "papel") || (escolhaUsuario == "papel" && escolhaApp == "pedra")
      ){
        setState(() {
          this._mensagem = "Você perdeu! burrão!";
        });
      } else {
        setState(() {
          this._mensagem = "Empatamos!!";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PEDRA, PAPEL OU TESOURA', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                  "Escolha do App",
                  textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          Image(image: this._imagemApp),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("assets/imagem/pedra.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("assets/imagem/papel.png",
                  height: 100,
                ),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("assets/imagem/tesoura.png",
                  height: 100,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
