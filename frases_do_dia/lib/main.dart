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
  var _frases = [
    "Tudo o que um sonho precisa para ser realizado é alguém que acredite que ele possa ser realizado",
    "Imagine uma nova história para sua vida e acredite nela",
    "A amizade desenvolve a felicidade e reduz o sofrimento, duplicando a nossa alegria e dividindo a nossa dor",
    "Nunca deixe ninguém te dizer que não pode fazer alguma coisa. Se você tem um sonho tem que correr atrás dele. As pessoas não conseguem vencer e dizem que você também não vai vencer. Se você quer uma coisa corre atrás",
    "Ser feliz sem motivo é a mais autêntica forma de felicidade"
  ];
  var _fraseGerada = "Clique abaixo para gerar uma frase";

  void _gerarFrase(){
    _indice = Random().nextInt(_frases.length);

    setState(() {
      _fraseGerada = _frases[_indice];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Frases do Dia"),
          backgroundColor: Colors.green,
          centerTitle: true
        ),

        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("images/logo.png"),
                Text(
                  _fraseGerada,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontStyle: FontStyle.italic, 
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.all(10)
                  ),
                  onPressed: _gerarFrase, 
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ]
            )
          )
        )

      );
  }
}