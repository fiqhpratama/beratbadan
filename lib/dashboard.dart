import 'package:flutter/material.dart';
import 'package:dashboard/saran_makan.dart';
import 'package:dashboard/kalkulator.dart';
import 'cron.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'flutter_dialog.dart';
import 'package:intl/intl.dart';
import 'dart:async';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
    String _timeString;
    String waktu;
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
    

  
  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime(DateTime.now());
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('@mipmap/notification');
    var initializationSettingsIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
        flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification: onSelectNotification);
    showNotification();
  }

  Future onSelectNotification(String payload) async {
    await Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new FoodList(payload)),
    );
  }

   Future<void> onDidReceiveLocalNotification(int id, String title, String body, String payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    
  }

  

   @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: _onWillPop,
      child: new Scaffold(
      appBar: AppBar(
        title: Text("Hitung Berat Badan Ideal"), //nama aplikasi
        elevation: .1,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2, //atur jumlah button per baris
          padding: EdgeInsets.all(3.0),
          children: <Widget>[ //buat menu utama halaman depan
            createMenuButton("Hitung Berat Badan", "assets/kalkulator.png",Kalkulator()),
            createMenuButton("Saran Makanan", "assets/diet.png",FoodList("ALL")),
            createMenuButtonReminder("Pengingat Waktu makan", "assets/reminder.png"),
            createMenuButtonAbout("About", "assets/about.png"),
          ],
        ),
      ),
    )
    );
    
  }



  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Apakah kamu yakin ingin keluar aplikasi?'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('Tidak'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Iya'),
          ),
        ],
      ),
    ) ?? false;
  }

  setWaktu(String strWaktu){
    return waktu == strWaktu;
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  showNotification() {
    var cron = new Cron();
    waktu = "ALL";

    cron.schedule(new Schedule.parse('*/1 * * * *'), () async {
      var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'your channel id', 'your channel name', 'your channel description',
      importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
      var iOSPlatformChannelSpecifics = IOSNotificationDetails();
      var platformChannelSpecifics = NotificationDetails(
      androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('kk:mm').format(now);
      

      if(formattedDate == "07:30"){
        String waktu = "PAGI";
        return await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);

      }else if(formattedDate == "08:00"){
        String waktu = "PAGI";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
        
      }else if(formattedDate == "08:30"){
        String waktu = "PAGI";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
        
      }else if(formattedDate == "12:00"){
        String waktu = "SIANG";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
        
      }else if(formattedDate == "12:30"){
        String waktu = "SIANG";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
        
      }else if(formattedDate == "18:00"){
        String waktu = "MALAM";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
        
      }else if(formattedDate == "18:30"){
        String waktu = "MALAM";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
        
      }else if(formattedDate == "19:00"){
        String waktu = "MALAM";
        await flutterLocalNotificationsPlugin.show(
        0, "Pukul "+ formattedDate + " Sudah waktunya makan "+ waktu +" Guys.." , 'yuks jangan sampe telat makan yaah..', platformChannelSpecifics,
        payload : waktu);
      } 

      
    });
    
  }



  Card createMenuButton(String title, String imageData,Widget onClick) { //fungsi buat menu
    return Card(
        margin: new EdgeInsets.all(10.0),
        elevation: 2.0,
        child: Container(
          child: new InkWell(
            child: new RaisedButton(
                child : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Image.asset(imageData,width: 100,height: 100,),),
                    new Center(child: new Text(title,textAlign: TextAlign.center,style:new TextStyle(fontSize: 14.0, color: Colors.black87)),),
                  ],
                ),
                onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => onClick));},
              ),
          ),
        ));
  }


  Card createMenuButtonAbout(String title, String imageData) { //fungsi buat menu
    return Card(
        margin: new EdgeInsets.all(10.0),
        elevation: 2.0,
        child: Container(
          child: new InkWell(
            child: new RaisedButton(
                child : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Image.asset(imageData,width: 100,height: 100,)),
                    new Center(child: new Text(title,textAlign: TextAlign.center,style:new TextStyle(fontSize: 14.0, color: Colors.black87)),),
                  ],
                ),
                onPressed: () {FlutterDialog().dialogAlert(context,"Tentang Aplikasi","Aplikasi Berat Badan Ideal V.0.1\n\nAplikasi ini dibuat untuk skripsi.\n\nSumber Artikel : \n\n-ilmupengetahuanumum.com\n\n-hellosehat.com");},
              ),
          ),
        ));
  }

  Card createMenuButtonReminder(String title, String imageData) { //fungsi buat menu
    return Card(
        margin: new EdgeInsets.all(10.0),
        elevation: 2.0,
        child: Container(
          child: new InkWell(
            child: new RaisedButton(
                child : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Center(child: Image.asset(imageData,width: 100,height: 100,)),
                    new Center(child: new Text(title,textAlign: TextAlign.center,style:new TextStyle(fontSize: 14.0, color: Colors.black87)),),
                  ],
                ),
                onPressed: () {FlutterDialog().dialogAlert(context,"Pengingat waktu makan","Aplikasi akan otomatis mengingatkan makan pada Waktu : \n\n-PAGI : 07.30 - 08.30\n\n-SIANG : 12.00 - 12.30\n\n-MALAM : 18.00 - 19.00\n\n");},
              ),
          ),
        ));
  }
}

