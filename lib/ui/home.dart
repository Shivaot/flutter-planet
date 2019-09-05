import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _weightController = new TextEditingController();
  int radioValue = 0;
  double _finalResult = 0.0;
  String _formattedText = "";
  void handleRadioValueChanged(int value) {
    setState(() {
      double _weightInKg = double.parse(_weightController.text) * 2.205;
      radioValue = value;
      switch (radioValue) {
        case 0:
          _finalResult = calculateWeight(_weightInKg, 0.06);
          _formattedText = "Your Weight On Pluto is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          _finalResult = calculateWeight(_weightInKg, 0.38);
          _formattedText = "Your Weight On Mars is ${_finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          _finalResult = calculateWeight(_weightInKg, 0.91);
          _formattedText = "Your Weight On Venus is ${_finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Plane X",
            style: new TextStyle(
              fontSize: 30.5,
              fontWeight: FontWeight.w500,
            )),
        centerTitle: true,
        backgroundColor: Colors.black54,
      ),
      backgroundColor: Colors.blueGrey[200],
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(5.6),
          children: <Widget>[
            Image.asset('images/planet.png', height: 200.0, width: 200.0),
            new Container(
              margin: const EdgeInsets.all(5.0),
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  new TextField(
                    controller: _weightController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      hintText: 'In Kg',
                      labelText: 'Your Weight On Earth',
                      icon: new Icon(Icons.person_outline),
                    ),
                  ),

                  new Padding(
                    padding: EdgeInsets.all(7.0),
                  ),

                  //three 3 Radio buttons goes here

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio<int>(
                        activeColor: Colors.brown,
                        value: 0,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "Pluto",
                        style: new TextStyle(
                            color: Colors.white70,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400),
                      ),
                      new Radio<int>(
                        activeColor: Colors.red,
                        value: 1,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "Mars",
                        style: new TextStyle(
                            color: Colors.white70,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400),
                      ),
                      new Radio<int>(
                        activeColor: Colors.orangeAccent[200],
                        value: 2,
                        groupValue: radioValue,
                        onChanged: handleRadioValueChanged,
                      ),
                      new Text(
                        "Venus",
                        style: new TextStyle(
                            color: Colors.white70,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                  Padding(
                    padding: new EdgeInsets.all(15.0),
                  ),

                  //text goes here

                  new Text(
                    _weightController.text.isEmpty ? "Please enter Weight" : _formattedText + "kg",
                    //"$_formattedText kg",
                    style: new TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.blue),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  double calculateWeight(double weight, double multiplier) {
    if (weight.toString().isNotEmpty && weight > 0) {
      return (weight * multiplier) / 2.205;
    } else {
      print('Wrong!');
      return double.parse('180') * .38;
    }
  }
}
