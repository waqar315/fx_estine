import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Signals extends StatefulWidget {
  @override
  _SignalsState createState() => _SignalsState();
}

class _SignalsState extends State<Signals> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: 'https://binary-signal.com/en/',
      withZoom: true,
      withJavascript: true,
    );
  }
}
