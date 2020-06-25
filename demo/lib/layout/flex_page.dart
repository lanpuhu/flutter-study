import 'package:flutter/material.dart';

class FlexAlignmentContent extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  FlexAlignmentContent({
    Key key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: this.mainAxisAlignment,
      crossAxisAlignment: this.crossAxisAlignment,
      children: <Widget>[
        Container(
          width: 60,
          height: 60,
          color: Colors.red,
        ),
        Container(
          width: 30,
          height: 30,
          color: Colors.green,
        ),
        Container(
          width: 90,
          height: 90,
          color: Colors.blue,
        ),
      ],
    );
  }
}

class FlexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FlexPageState();
}

class _FlexPageState extends State<FlexPage> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.center;

  void updateMainAxisAlignment(value) {
    setState(() {
      _mainAxisAlignment = value;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flex Widget'),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 120,
            color: Colors.grey[300],
            child: FlexAlignmentContent(
              mainAxisAlignment: this._mainAxisAlignment,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
          Text(
            "MainAxisAlignment",
          ),
          Row(
            children: <Widget>[
              Radio(
                value: MainAxisAlignment.start,
                groupValue: this._mainAxisAlignment,
                onChanged: (value) => this.updateMainAxisAlignment(value),
              ),
              Radio(
                value: MainAxisAlignment.center,
                groupValue: this._mainAxisAlignment,
                onChanged: (value) => this.updateMainAxisAlignment(value),
              ),
              Radio(
                value: MainAxisAlignment.end,
                groupValue: this._mainAxisAlignment,
                onChanged: (value) => this.updateMainAxisAlignment(value),
              ),
              Radio(
                value: MainAxisAlignment.spaceBetween,
                groupValue: this._mainAxisAlignment,
                onChanged: (value) => this.updateMainAxisAlignment(value),
              ),
              Radio(
                value: MainAxisAlignment.spaceAround,
                groupValue: this._mainAxisAlignment,
                onChanged: (value) => this.updateMainAxisAlignment(value),
              ),
              Radio(
                value: MainAxisAlignment.spaceEvenly,
                groupValue: this._mainAxisAlignment,
                onChanged: (value) => this.updateMainAxisAlignment(value),
              ),
            ],
          ),
          Text(
            "CrossAxisAlignment",
          ),
        ],
      ),
    );
  }
}