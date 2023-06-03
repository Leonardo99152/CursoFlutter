import 'package:flutter/material.dart';

class AlcoolOuGasolina extends StatefulWidget {
  const AlcoolOuGasolina({super.key});

  @override
  State<AlcoolOuGasolina> createState() => _AlcoolOuGasolinaState();
}

class _AlcoolOuGasolinaState extends State<AlcoolOuGasolina> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _mensagem = "";

  void _calcular(){
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);

    if((precoAlcool == null) || (precoGasolina == null)){
      setState(() {
        _mensagem = "Número inválido";
      });
    } else if( (precoAlcool / precoGasolina) <= 0.7){
      setState(() {
        _mensagem = "Melhor colocar álcool";
      });
    } else {
      setState(() {
        _mensagem = "Melhor colocar gasolina";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alcool ou Gasolina"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset("images/logo.png")
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  )
                )
              ),
              
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool"
                  ),
                  controller: _controllerAlcool,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gasolina"
                  ),
                  controller: _controllerGasolina,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                onPressed: _calcular,
                child: Text("Calcular"))
              ),

              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  _mensagem,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 20
                  )
                )
              ),
          ])
      )
    );
  }
}