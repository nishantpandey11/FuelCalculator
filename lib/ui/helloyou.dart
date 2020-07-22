import 'package:flutter/material.dart';

class FuelForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //  State<StatefulWidget> createState() => _HelloYouState();
    return _FuelFormState();
  }
}

class _FuelFormState extends State<FuelForm> {
  String result = '';
  final double formDistance = 5.0;
  final _currencies = ['Rupees', 'Euro', 'Pounds'];
  String _currency = 'Rupees';

  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  onDropdownChanged(String val) {
    setState(() {
      this._currency = val;
    });
  }

  String _calculate() {
    double _distance = double.parse(distanceController.text);
    double _fuelCost = double.parse(priceController.text);
    double _consumption = double.parse(avgController.text);

    String totalCost =
        ((_distance / _consumption) * _fuelCost).toStringAsFixed(2);
    return 'Total cost for your trip is $totalCost $_currency';
  }

  _reset() {
    distanceController.text = '';
    priceController.text = '';
    avgController.text = '';
    setState(() {
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuel cost calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(top: formDistance, bottom: formDistance),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'e.g. 124',
                      labelStyle: textStyle,
                      labelText: 'Distance',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  controller: distanceController,
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: formDistance, bottom: formDistance),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'e.g. 17',
                      labelStyle: textStyle,
                      labelText: 'Avg. of vehicle',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  controller: avgController,
                )),
            Padding(
              padding: EdgeInsets.only(top: formDistance, bottom: formDistance),
              child: Row(children: <Widget>[
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: 'e.g. 1.65',
                      labelStyle: textStyle,
                      labelText: 'Fuel Price/ltr',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  keyboardType: TextInputType.number,
                  controller: priceController,
                )),
                Container(
                  width: 5 * formDistance,
                ),
                Expanded(
                    child: DropdownButton<String>(
                  items: _currencies
                      .map((String val) => DropdownMenuItem<String>(
                          value: val, child: Text(val)))
                      .toList(),
                  value: _currency,
                  onChanged: (String value) {
                    onDropdownChanged(value);
                  },
                ))
              ]),
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: formDistance, bottom: formDistance),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      onPressed: () {
                        setState(() {
                          result = _calculate();
                        });
                      },
                      child: Text(
                        'Submit',
                        textScaleFactor: 1.5,
                      ),
                    )),
                    Expanded(
                        child: RaisedButton(
                      color: Theme.of(context).buttonColor,
                      textColor: Theme.of(context).primaryColorDark,
                      onPressed: () {
                        setState(() {
                          _reset();
                        });
                      },
                      child: Text(
                        'Reset',
                        textScaleFactor: 1.5,
                      ),
                    ))
                  ],
                )),
            Padding(
                padding:
                    EdgeInsets.only(top: formDistance, bottom: formDistance),
                child: Text(
                  result, //style: Theme.of(context).textTheme.headline4,
                )),
          ],
        ),
      ),
    );
  }
}
