import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';

// |===========================================================================================|
// | FLUTTER DIALOG DART FILE                                                                  |
// | Create by : fiqhpratama, Modify from rfflutter_alert                                      |
// |                                                                                           |
// | HOW TO INSTALL : pada file pubspec.yaml, tambahkan dependencies dibawah ini               |
// |                                                                                           |
// | rflutter_alert:                                                                           |
// |     git: git://github.com/RatelHub/rflutter_alert.git                                     |   
// |                                                                                           |
// | lalu jangan lupa untuk perintah "flutter packages get"                                    |
// |===========================================================================================|


class FlutterDialog{
  
  void dialogAlert(BuildContext context,String title,msg){
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.normal),
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.none,
      title: title,
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blue,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }

  void dialogError(BuildContext context,String title,msg){
    var alertStyle = AlertStyle(
      animationType: AnimationType.grow,
      isCloseButton: false,
      isOverlayTapDismiss: false,
      descStyle: TextStyle(fontWeight: FontWeight.normal),
      animationDuration: Duration(milliseconds: 500),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
    );

    Alert(
      context: context,
      style: alertStyle,
      type: AlertType.error,
      title: title,
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blue,
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }


  void dialogConfirm( BuildContext context,String title,msg){
     
    Alert(
      context: context,
      type: AlertType.warning,
      title: title,
      desc: msg,
      buttons: [
        DialogButton(
          child: Text(
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blue,
        ),
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          color: Colors.blue,
        )
      ],
    ).show();
  }
  

}