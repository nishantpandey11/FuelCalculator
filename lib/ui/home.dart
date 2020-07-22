import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrangeAccent,
            padding: EdgeInsets.only(top: 30, left: 10),
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Expanded(child: Text("Margherita",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: "Oxygen",
                        fontWeight: FontWeight.normal)
                )
                ),
                Expanded(child: Text("Mozzarella,Tomato,Basil",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: "Oxygen",
                        fontWeight: FontWeight.normal)
                )
                )

              ],),
              Row(children: <Widget>[
                Expanded(child: Text("Marinara",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: "Oxygen",
                        fontWeight: FontWeight.normal)
                )
                ),
                Expanded(child: Text("Tomato,Garlic",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        fontSize: 20.0,
                        decoration: TextDecoration.none,
                        fontFamily: "Oxygen",
                        fontWeight: FontWeight.normal)
                )
                )

              ],
              ),
              PizzaImageWidget(),
              OrderButton()
            ],
            )

        )
    );
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/pizza.png');
    Image image = Image(image: assetImage, width: 400.0, height: 400.0);
    return Container(child: image);
  }

}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = Container(
        margin: EdgeInsets.only(top: 50.0),
        child: RaisedButton(
            child: Text("Order your Pizza"),
            elevation: 5.0,
            color: Colors.lightGreen,
            onPressed: () {
              order(context);
            }
        )


    );

    return button;
  }

  void order(BuildContext context) {
    var alert = AlertDialog(
      title: Text("Order completed"),
      content: Text("Thanks for your order"),
    );
    showDialog(
        context:context,
        builder: (BuildContext context) => alert
       /* builder: (BuildContext context){
          return alert;
        }*/
    );


  }


}
