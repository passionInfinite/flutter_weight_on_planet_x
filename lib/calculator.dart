import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new CalculatorState();
  }
}

class CalculatorState extends State<Calculator> {

  TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _result = 0.0;

  void handleRadioValueChange(int value) {
    setState(() {
      radioValue = value;

      switch(value){
        case 0:
            _result = calculateWeight(_weightController.text, 0.06);
            break;
        case 1:
            _result = calculateWeight(_weightController.text, 0.38);
            break;
        case 2:
            _result = calculateWeight(_weightController.text, 0.91);
            break;
      }
    });
  }

  double calculateWeight(String weight, double multiplier) {
    if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0) {
      return int.parse(weight)*multiplier.toDouble();
    }
    return 0.0;
  }

  void _handleOnChangeInput(String value) {
    this.handleRadioValueChange(radioValue);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight on Planet X"),
        backgroundColor: Colors.black54,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: new Container(
        child: new ListView(
          padding: new EdgeInsets.only(top: 20.0),
          children: <Widget>[
            new Center(
              child: new Image.asset('images/planet.png', scale: 2.5),
            ),
            new Container(
              margin: new EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    onChanged: _handleOnChangeInput,
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      labelStyle: new TextStyle(fontSize: 20.0),
                      labelText: "Your weight on Earth",
                      hintText: "In Pounds",
                      contentPadding: new EdgeInsets.all(10.0),
                      icon: new Container(
                        margin: new EdgeInsets.only(left: 8.0, top: 16.0),
                        child: new Icon(Icons.person_outline, size: 36.0),
                      ),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Row(
                    children: <Widget>[
                      new Radio<int>(value: 0, groupValue: radioValue, onChanged: handleRadioValueChange, activeColor: Colors.brown),
                      new Text("Pluto", style: new TextStyle(color: Colors.black54, fontSize: 24.0)),
                      new Radio<int>(value: 1, groupValue: radioValue, onChanged: handleRadioValueChange, activeColor: Colors.red),
                      new Text("Mars", style: new TextStyle(color: Colors.black54, fontSize: 24.0)),
                      new Radio<int>(value: 2, groupValue: radioValue, onChanged: handleRadioValueChange, activeColor: Colors.orangeAccent),
                      new Text("Venus", style: new TextStyle(color: Colors.black54, fontSize: 24.0)),
                    ],
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 20.0, bottom: 20.0)),
                ],
              ),
            ),
            new Container(
              margin: new EdgeInsets.only(left: 40.0),
              child: new Text("Calculated weight:", textAlign: TextAlign.left, style: new TextStyle(fontSize: 24.0), textDirection: TextDirection.ltr),
            ),
            new Center(
              child: new Container(
                margin: new EdgeInsets.only(top: 40.0),
                child: new Text("${_result.toStringAsFixed(2)}", textAlign: TextAlign.left, style: new TextStyle(fontSize: 84.0, fontWeight: FontWeight.bold), textDirection: TextDirection.ltr)
              ),
            ),
            new Center(
              child: new Container(
                  margin: new EdgeInsets.only(top: 40.0),
                  child: new Text("* calculated weight is in pounds!", style: new TextStyle(fontSize: 12.0, color: Colors.red), textAlign: TextAlign.center)
              ),
            ),
          ],
        ),
      ),
    );
  }
}