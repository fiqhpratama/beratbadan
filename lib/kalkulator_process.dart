import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dashboard/dashboard.dart';
import 'package:dashboard/config.dart';
import 'package:flutter/scheduler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class KalkulatorProcess extends StatefulWidget {
  @override
  KalkulatorProcess(this.beratBadan,this.tinggiBadan);
  final int beratBadan;
  final int tinggiBadan;

  _KalkulatorProcess createState() => new _KalkulatorProcess(this.beratBadan,this.tinggiBadan);
}

class _KalkulatorProcess extends State {
  GlobalKey<RefreshIndicatorState> indicator = new GlobalKey<RefreshIndicatorState>();
  Completer<Null> completer = new Completer<Null>();
  @override
  _KalkulatorProcess(this.beratBadan,this.tinggiBadan);
  final int beratBadan;
  final int tinggiBadan;
  String _saveHasil;

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
      body: RefreshIndicator(
        key: indicator,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: _renderComponent,
        ),
    ));
    
  }

   Widget _renderComponent(BuildContext context, int index) {
    return new Card(
          child: new Column(
            children: <Widget>[
                SizedBox( height: 50.0),
                 Text("Hitung Berat Badan Ideal",textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
                 SizedBox( height: 10.0),
                 
                 SizedBox( height: 50.0),
                 Text("Hasil Perhitungan berat badan",textAlign: TextAlign.left, style: TextStyle(fontSize: 24)),
                 SizedBox( height: 10.0),
                 Column(
                    children: [
                     hasil()
                    ],
                  ),
                exitbutton()
            ],
          ),
        );
  }
  

_saveHasilPreference(String hasil) async {
    try {
        SharedPreferences prefs=await SharedPreferences.getInstance();   
        prefs.setString("hasil", hasil);
    } catch (e) {
        print(e);
    }
}

Widget exitbutton() {
    return Container(
                  color: Colors.transparent,
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: FlatButton(
                    onPressed: () async {
                      Navigator.pop(context,MaterialPageRoute(builder: (context) => Dashboard()));
                      await _saveHasilPreference(_saveHasil);
                      },
                    color: Colors.blue,
                    child: Text(
                      "Simpan dan hitung ulang ..",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Raleway',
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
  }

  


  Widget hasil() {


    return Container(            
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Table(
                border: TableBorder.all(width: 1.0, color: Colors.black),
                children: [

                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text('Body Mass Index',style: TextStyle(fontSize: 20)),
                          new Text(data[0]['bmi'].toString(),style: TextStyle(fontSize: 24)),
                          
                        ],
                      ),
                    )
                  ]),

                  TableRow(children: [
                    TableCell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new Text('Kategori',style: TextStyle(fontSize: 20)),
                          new Text(data[0]['hasil'].toString(),style: TextStyle(fontSize: 24)),
                        ],
                      ),
                    )
                  ]),

                  

                
               
                ],
              ),
            ),
          );
  }
  




  @override
  void initState(){
    this.calculateData();
    super.initState();
  }



  List data;
  Future<String> calculateData() async{
    SchedulerBinding.instance.addPostFrameCallback((_){  indicator.currentState.show(); } );
    http.Response response = await http.get(
      Uri.encodeFull(Config.serverHost+"/beratbadan/webservice/kalkulator.php?beratbadan="+beratBadan.toString()+"&tinggibadan="+tinggiBadan.toString()+""),
      headers: { HttpHeaders.acceptHeader:"application/json",}
    );
    setState((){
      data = json.decode(response.body);
      _saveHasil = data[0]['hasil'].toString();
    });
    completer.complete();
    return "OK";
  }

  Future<Null> _onRefresh() {
    return completer.future;
  }

}