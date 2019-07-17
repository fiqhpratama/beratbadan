import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/scheduler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dashboard/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodList extends StatefulWidget {
  @override
  FoodList(this.waktu);
  final String waktu;
  _FoodList createState() => new _FoodList(waktu);
}

class _FoodList extends State {
  _FoodList(this.waktu);
  final String waktu;
  GlobalKey<RefreshIndicatorState> indicator = new GlobalKey<RefreshIndicatorState>();
  Completer<Null> completer = new Completer<Null>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Daftar Saran Makanan"),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          SizedBox(
            width: 5.0,
          ),
        ],
      ),
      body:  RefreshIndicator(
        key: indicator,
        onRefresh: _onRefresh,
        child: ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: _getFoodListData,
        ),
    ));
  }


  @override
  void initState(){
    super.initState();
    this.getFoodData();
    
  }


  List data;

  Future<String> getFoodData() async{
    SchedulerBinding.instance.addPostFrameCallback((_){  indicator.currentState.show(); } );
    SharedPreferences prefs=await SharedPreferences.getInstance();   
    var kategori = prefs.getString("hasil");
    http.Response response = await http.get(
      Uri.encodeFull(Config.serverHost+"/beratbadan/webservice/getfood.php?kategori="+kategori+"&waktu="+waktu),
      headers: {
        HttpHeaders.acceptHeader:"application/json",
      }
    );
    setState((){
      data = json.decode(response.body);
    });
    completer.complete(); //completer  refresh indicator
    return "OK";
  }

  Future<Null> _onRefresh() {
    return completer.future;
  }

  Widget _getFoodListData(BuildContext context, int index) {
  return new Padding(padding: new EdgeInsets.all(1.0),
        child: new Card(
          child: new Column(
            children: <Widget>[
              new ListTile(
                title: new Text(data[index]['nama_makanan'].trim(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                subtitle: new Text("Kategori : "+data[index]['kategori'].trim()),
              ),
              new ButtonTheme.bar(
                child: new ButtonBar(
                  children: <Widget>[
                    new Text("Waktu Makan : " + data[index]['jam_ideal'].trim(),style: TextStyle(fontSize: 12)),
                    new RaisedButton(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Info Makanan",style: TextStyle(color: Colors.white)),
                      color: Colors.blue,
                      onPressed: () { 
                        openGoogle(data[index]['nama_makanan'].toString());
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
}

static openGoogle(String url) async {
    String googleUrl = 'https://www.google.com/search?q=$url';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the URL.';
    }
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