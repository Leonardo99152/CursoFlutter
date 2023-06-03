import 'dart:math';

import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Home()
    )
  );
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _indice;
  var _jogadaApp = "padrao";
  var _escolhas = ["pedra", "papel", "tesoura"];

  var _resposta = "Escolha uma opção abaixo:";

  void _jogar(var jogadaUsuario){
    _indice = Random().nextInt(3);

    setState(() {
      _jogadaApp = _escolhas[_indice];
    });

    if(_jogadaApp == jogadaUsuario){
      setState(() {
        _resposta = "Empatou!";
      });
    }
    else if(_jogadaApp == "pedra"){
      if(jogadaUsuario == "papel"){        
        setState(() {
          _resposta = "Você venceu!";
        });
      }
      else if(jogadaUsuario == "tesoura"){
        setState(() {
          _resposta = "Você perdeu!";
        });
      }
    }
    else if(_jogadaApp == "papel"){
      if(jogadaUsuario == "tesoura"){
        setState(() {
          _resposta = "Você venceu!";
        });
      }
      else if(jogadaUsuario == "pedra"){
        setState(() {
          _resposta = "Você perdeu!";
        });
      }
    }
    else if(_jogadaApp == "tesoura"){
      if(jogadaUsuario == "pedra"){
        setState(() {
          _resposta = "Você venceu!";
        });
      }
      else if(jogadaUsuario == "papel"){
        setState(() {
          _resposta = "Você perdeu!";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokenpo"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold 
              )
            ),
          ),

          Image.asset("images/${_jogadaApp}.png"),

          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _resposta,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold 
              )
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _jogar("pedra");
                },
                child: Image.asset("images/pedra.png", height: 110)
              ),

              GestureDetector(
                onTap: () {
                  _jogar("papel");
                },
                child: Image.asset("images/papel.png", height: 110)
              ),

              GestureDetector(
                onTap: () {
                  _jogar("tesoura");
                },
                child: Image.asset("images/tesoura.png", height: 110)
              ),
            ]
          )
        ]
        ),
      );
  }
}