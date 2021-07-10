import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'SubHome/PriceList.dart';
import 'SubHome/StockPriceChart.dart';
import 'SubHome/charts.dart';

import 'SubHome/news.dart';
import 'SubHome/signals.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _options = [
    "Charts & Sites",
    "News & Timely Report",
    "Stock Price Historical Chart",
    "Signals",
    "Currencies List",
  ];
  List<Widget> _pages = [
    Charts(),
    News(),
    StockPriceChart(),
    Signals(),
    PriceList(),
  ];

  int _currentIndexOptions = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        backgroundColor: Color(0xff0A0F32),
        title: Text(
          _options[_currentIndexOptions],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Color(0xff272A4D),
        child: Center(
          child: _pages[_currentIndexOptions],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Color(0xff0A0F32),
        buttonBackgroundColor: Color(0xff0A0F32),
        backgroundColor: Color(0xff272A4D),
        animationDuration: Duration(seconds: 1),
        animationCurve: Curves.bounceOut,
        items: <Widget>[
          Icon(
            Icons.insights,
            color: Color(0xffB3B4C2),
          ),
          Icon(
            Icons.article,
            color: Color(0xffB3B4C2),
          ),
          Icon(
            Icons.price_check,
            color: Color(0xffB3B4C2),
          ),
          Icon(
            Icons.stream,
            color: Color(0xffB3B4C2),
          ),
          Icon(
            Icons.money,
            color: Color(0xffB3B4C2),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndexOptions = index;
          });
        },
      ),
    );
  }
}
