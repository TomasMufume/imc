import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),

  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController pesocontrolador = TextEditingController();
  TextEditingController alturacontrolador = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey();

  String _infoText = "0";

  void _limparCampos() {
    pesocontrolador.text = "";
    alturacontrolador.text = "";
    setState(() {
      _infoText = "0";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesocontrolador.text);
      double altura = double.parse(alturacontrolador.text) / 100;
      double imc = peso / (altura * altura);
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40){
      _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }

      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text(
          "Indice de Massa Corporal", style: TextStyle(color: Colors.white),),
        centerTitle: true,

        actions: [

          IconButton(icon: Icon(Icons.stream), onPressed: _limparCampos)
        ],
      ),
      backgroundColor: Colors.yellowAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(padding: EdgeInsets.all(40)),

              Icon(Icons.stream, size: 100, color: Colors.brown,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Pego (Kg)",
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                controller: pesocontrolador,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira seu Peso!";
                  }
                },

              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                controller: alturacontrolador,
                validator: (value){
                  if(value.isEmpty){
                    return "Insira sua Altura!";
                  }
                },

              ),
              Padding(
                padding: EdgeInsets.only(top: 25, bottom: 40),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        _calcular();
                      }
                    },
                    child: Text("Calcular",
                      style: TextStyle(color: Colors.yellowAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    color: Colors.brown,
                  ),
                ),
              ),
              Text(_infoText, textAlign: TextAlign.center,
                style: TextStyle(color: Colors.brown, fontSize: 25),)
            ],

          ),
        ),
      ),
    );
  }
}
