import 'package:flutter/material.dart';
void main(){
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text("Indice de Massa Corporal", style: TextStyle(color: Colors.white),),
        centerTitle: true,

        actions: [

          IconButton(icon: Icon(Icons.stream), onPressed: () {})
        ],
      ),
      backgroundColor: Colors.yellowAccent,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.all(40)),

            Icon(Icons.stream, size: 100, color: Colors.brown,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Pego (Kg)",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.brown, fontSize: 25, fontWeight: FontWeight.bold),

            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.brown, fontSize: 25, fontWeight: FontWeight.bold),

            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 40),
              child: Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () {},
                  child: Text("Calcular",
                    style: TextStyle(color: Colors.yellowAccent, fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.brown,
                ),
              ),
            ),
            Text("Info",textAlign: TextAlign.center, style: TextStyle(color: Colors.brown, fontSize: 25), )
          ],

        ),
      ),
    );
  }
}
