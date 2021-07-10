import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class StockPriceChart extends StatelessWidget {
  const StockPriceChart({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff0A0F32),
        body: WebviewScaffold(
          url: 'https://fxesine.000webhostapp.com/index.php/1148-2/',
          withZoom: true,
          withJavascript: true,
        ),
      ),
    );
  }
}
