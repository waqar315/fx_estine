import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Charts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WebviewScaffold(
          url: 'https://charts.binary.com/',
          withZoom: true,
          withJavascript: true,
        ),
      ),
    );
  }
}
