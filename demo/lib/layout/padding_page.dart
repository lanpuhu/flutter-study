import 'package:flutter/material.dart';

class LayoutPaddingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Padding Widget'),),
      body: Row(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            color: Colors.blue[50],
            child: Padding(
              padding: EdgeInsets.all(50),
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