import 'package:flutter/material.dart';
import 'package:jogo/jogo.dart';
import 'package:jogo/jogo2.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escolha seu jogo", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("JokenPo"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Jogo()),);
              },
            ),
          ),
          Padding(padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("Par ou Ímpar"),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Jogo2()),);
              },
            ),
          )
        ],
      ),
    );
  }
}
