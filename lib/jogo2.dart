import 'package:flutter/material.dart';
import 'dart:math';

class Jogo2 extends StatefulWidget {
  const Jogo2({super.key});

  @override
  State<Jogo2> createState() => _Jogo2State();
}

class _Jogo2State extends State<Jogo2> {
  int? _numeroApp;
  int? _numeroUsuario;
  String _mensagem = "Escolha entre Par ou Ímpar";
  String? _escolhaUsuario;
  bool _mostrarCampoTexto = false;
  bool _mostrarResultado = false;
  final TextEditingController _controller = TextEditingController();

  void _opcaoSelecionada(String escolha) {
    setState(() {
      _escolhaUsuario = escolha;
      _mostrarCampoTexto = true;
      _mensagem = "Digite um número entre 0 e 10";
    });
  }

  void _calcularResultado() {
    int? numeroUsuario = int.tryParse(_controller.text);
    if (numeroUsuario == null || numeroUsuario < 0 || numeroUsuario > 10) {
      setState(() {
        _mensagem = "Por favor, digite um número válido entre 0 e 10.";
      });
      return;
    }

    int numeroApp = Random().nextInt(11);
    int soma = numeroUsuario + numeroApp;
    bool resultadoPar = soma % 2 == 0;

    String vencedor = (_escolhaUsuario == "Par" && resultadoPar) || (_escolhaUsuario == "Ímpar" && !resultadoPar)
        ? "🎉 Você ganhou!"
        : "😞 Você perdeu!";

    setState(() {
      _numeroUsuario = numeroUsuario;
      _numeroApp = numeroApp;
      _mensagem = vencedor;
      _mostrarCampoTexto = false;
      _mostrarResultado = true;
    });
  }

  void _reiniciarJogo() {
    setState(() {
      _mensagem = "Escolha entre Par ou Ímpar";
      _escolhaUsuario = null;
      _numeroApp = null;
      _numeroUsuario = null;
      _mostrarCampoTexto = false;
      _mostrarResultado = false;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Par ou Ímpar',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            if (_escolhaUsuario == null)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => _opcaoSelecionada("Par"),
                    child: Text(
                      "Par",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => _opcaoSelecionada("Ímpar"),
                    child: Text(
                      "Ímpar",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    ),
                  ),
                ],
              ),

            if (_mostrarCampoTexto)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: "Digite um número (0 a 10)",
                        border: OutlineInputBorder(
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _calcularResultado,
                      child: Text(
                        "Confirmar",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            if (_mostrarResultado) ...[
              SizedBox(height: 20),
              Text(
                "Seu número: $_numeroUsuario",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Número do App: $_numeroApp",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: _reiniciarJogo,
                child: Text(
                  "Jogar novamente",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],

            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Voltar para tela inicial',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
