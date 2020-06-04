import 'package:flutter/material.dart';

class LayoutAlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align Widget'),),
      body: Row(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.topLeft,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.blue[100],
            child: Align(
              alignment: Alignment.center,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
          Container(
            width: 120,
            height: 120,
            color: Colors.blue[50],
            child: Align(
              alignment: Alignment.bottomRight,
              child: FlutterLogo(
                size: 60,
              ),
            ),
          ),
        ],
      ),
    );
  }
}