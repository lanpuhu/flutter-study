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
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Row(
          mainAxisAlignment: this.mainAxisAlignment,
          crossAxisAlignment: this.crossAxisAlignment,
          textBaseline: TextBaseline.alphabetic,
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
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
                '${this.mainAxisAlignment}',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
                '${this.crossAxisAlignment}',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
            ),
          ],
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

  void updateCrossAxisAlignment(value) {
    setState(() {
      _crossAxisAlignment = value;
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
              crossAxisAlignment: this._crossAxisAlignment,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10
            ),
            child: Text(
              "MainAxisAlignment",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Radio(
                    value: MainAxisAlignment.start,
                    groupValue: this._mainAxisAlignment,
                    onChanged: this.updateMainAxisAlignment,
                  ),
                  Text('start'),
                  Radio(
                    value: MainAxisAlignment.spaceBetween,
                    groupValue: this._mainAxisAlignment,
                    onChanged: this.updateMainAxisAlignment,
                  ),
                  Text('spaceBetween'),
                ],
              ),
              Column(
                children: <Widget>[
                  Radio(
                    value: MainAxisAlignment.center,
                    groupValue: this._mainAxisAlignment,
                    onChanged: this.updateMainAxisAlignment,
                  ),
                  Text('center'),
                  Radio(
                    value: MainAxisAlignment.spaceAround,
                    groupValue: this._mainAxisAlignment,
                    onChanged: this.updateMainAxisAlignment,
                  ),
                  Text('spaceAround'),
                ],
              ),
              Column(
                children: <Widget>[
                  Radio(
                    value: MainAxisAlignment.end,
                    groupValue: this._mainAxisAlignment,
                    onChanged: this.updateMainAxisAlignment,
                  ),
                  Text('end'),
                  Radio(
                    value: MainAxisAlignment.spaceEvenly,
                    groupValue: this._mainAxisAlignment,
                    onChanged: this.updateMainAxisAlignment,
                  ),
                  Text('spaceEvenly'),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 10
            ),
            child: Text(
              "CrossAxisAlignment",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Radio(
                    value: CrossAxisAlignment.start,
                    groupValue: this._crossAxisAlignment,
                    onChanged: this.updateCrossAxisAlignment,
                  ),
                  Text('start'),
                  Radio(
                    value: CrossAxisAlignment.stretch,
                    groupValue: this._crossAxisAlignment,
                    onChanged: this.updateCrossAxisAlignment,
                  ),
                  Text('stretch'),
                ],
              ),
              Column(
                children: <Widget>[
                  Radio(
                    value: CrossAxisAlignment.center,
                    groupValue: this._crossAxisAlignment,
                    onChanged: this.updateCrossAxisAlignment,
                  ),
                  Text('center'),
                  Radio(
                    value: CrossAxisAlignment.baseline,
                    groupValue: this._crossAxisAlignment,
                    onChanged: this.updateCrossAxisAlignment,
                  ),
                  Text('baseline'),
                ],
              ),
              Column(
                children: <Widget>[
                  Radio(
                    value: CrossAxisAlignment.end,
                    groupValue: this._crossAxisAlignment,
                    onChanged: this.updateCrossAxisAlignment,
                  ),
                  Text('end'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}