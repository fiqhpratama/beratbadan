import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dashboard/kalkulator_process.dart';
import 'package:dashboard/config.dart';

class Kalkulator extends StatefulWidget {
  @override
  _Kalkulator createState() => new _Kalkulator();
}

class _Kalkulator extends State {
  GlobalKey<RefreshIndicatorState> indicator = new GlobalKey<RefreshIndicatorState>();
  Completer<Null> completer = new Completer<Null>();

  final beratbadanController = TextEditingController();
  final tinggibadanController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Hitung Berat Badan Ideal"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      body: new Card(
          child: new Column(
            children: <Widget>[
                 SizedBox( height: 10.0),
                 Column(
                    children: [
                      Text("Input Tinggi badan (cm)"),
                      SizedBox( height: 5.0),
                      tinggibadan(),
                      Text("Input Berat badan (Kg)"),
                      SizedBox( height: 5.0),
                      beratbadan(),
                      SizedBox( height: 15),
                      submitbutton()
                    ],
                  ),
            
            ],
          ),
        ));
  }


  Widget tinggibadan() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        hintText: "Input tinggi badan (cm)",
        labelText: "Tinggi badan",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      controller: tinggibadanController,
    );
  }

  Widget beratbadan() {
    return new TextFormField(
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(5.0),
          ),
        ),
        hintText: "Input berat badan (kg)",
        labelText: "Berat badan",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black26),
      ),
      controller: beratbadanController,
    );
  }


  Widget submitbutton() {
    return Container(
                  width: 300,
                  child: FlatButton(
                    onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => KalkulatorProcess(int.tryParse(beratbadanController.text),int.tryParse(tinggibadanController.text))));},
                    color: Colors.blue,
                    child: Text(
                      "Hitung ...",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
  }


  @override
  void initState(){
    super.initState();
    
  }


String limitCharacter(String character,int sizeChar){
  int longchar = character.length;
  String res = character;
  if (longchar > sizeChar){
      res = character.substring(0,sizeChar)+"...";
  }
  return res;
}




  

}