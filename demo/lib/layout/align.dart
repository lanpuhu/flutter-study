import 'package:flutter/material.dart';

class LayoutAlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),),
      body: Center(
        child: RaisedButton(
          child: Text("Go back"),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
      ),
    );
  }
}