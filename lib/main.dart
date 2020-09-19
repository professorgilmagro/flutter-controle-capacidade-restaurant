import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(title: "Restaurante do Magrão", home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const MAXIMUM_CAPACITY = 40;
  int _count = 0;
  String _display = "Pode entrar";

  void updateCount(int delta) {
    setState(() {
      bool isAdd = delta == 1;

      if (isAdd && !isMaximumCapacity() || !isAdd && _count > 0) {
        this._count += delta;
      }

      _display =
          isMaximumCapacity() ? 'Limite atingido. Aguarde!' : 'Pode entrar!';
    });
  }

  bool isMaximumCapacity() => _count == MAXIMUM_CAPACITY;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset("assets/images/restaurant2.jpg",
            height: 1000,
            fit: BoxFit.cover,
            color: Color.fromRGBO(255, 255, 255, 0.5),
            colorBlendMode: BlendMode.modulate),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_count",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: Colors.purple,
                      visualDensity: VisualDensity.comfortable,
                      padding: EdgeInsets.all(20),
                      onPressed: () {
                        updateCount(1);
                      },
                      child: Text('+ 1',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none)),
                    )),
                Padding(
                    padding: EdgeInsets.all(20),
                    child: RaisedButton(
                      color: Colors.green,
                      padding: EdgeInsets.all(20),
                      visualDensity: VisualDensity.comfortable,
                      onPressed: () {
                        updateCount(-1);
                      },
                      child: Text('- 1',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none)),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "$_display!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            )
          ],
        )
      ],
    );
  }
}
