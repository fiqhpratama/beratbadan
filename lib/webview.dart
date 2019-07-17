import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/config.dart';

class Webview extends StatefulWidget {
  @override
  Webview(this.urlWebView);
  final String urlWebView;
  _WebviewState createState() => new _WebviewState(urlWebView);
}

class _WebviewState extends State<Webview> {
  @override
  _WebviewState(this.urlWebView);
  final String urlWebView;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aplikasi Kehamilan"),
        elevation: .1,
        backgroundColor: Colors.indigo,
      ),
     body: WebView(
        initialUrl: Config.serverHost+'/bumil-apps/webview/'+ urlWebView,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
    
  }




}

