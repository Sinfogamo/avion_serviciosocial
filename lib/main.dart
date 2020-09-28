import 'package:avion_ss/screens/controller.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Juego del Avión',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Juego del Avión'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Controller control;
  String nombre, numBloqueado;
  @override
  void initState() {
    super.initState();
    control = new Controller(2);
    nombre = "jugador";
    numBloqueado = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Nombre del jugador: "),
                  Text(control.jugadorActual.nombre),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Numero Bloqueado: "),
                  Text(control.jugadorActual.numBloqueado.toString()),
                ],
              ),
              Container(
                height: 20.0,
              ),
              ButtonTheme(
                minWidth: 120.0,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    control.leerPisada(10);
                    setState(() {});
                  },
                  color: control.colorear(10) ? Colors.red : Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    "10",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(9);
                  setState(() {});
                },
                color: control.colorear(9) ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  "9",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      control.leerPisada(8);
                      setState(() {});
                    },
                    color: control.colorear(8) ? Colors.red : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text(
                      "8",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(
                    indent: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      control.leerPisada(7);
                      setState(() {});
                    },
                    color: control.colorear(7) ? Colors.red : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text(
                      "7",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(6);
                  setState(() {});
                },
                color: control.colorear(6) ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  "6",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      control.leerPisada(5);
                      setState(() {});
                    },
                    color: control.colorear(5) ? Colors.red : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Divider(
                    indent: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      control.leerPisada(4);
                      setState(() {});
                    },
                    color: control.colorear(4) ? Colors.red : Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: Text(
                      "4",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(3);
                  setState(() {});
                },
                color: control.colorear(3) ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  "3",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(2);
                  setState(() {});
                },
                color: control.colorear(2) ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(1);
                  setState(() {});
                },
                color: control.colorear(1) ? Colors.red : Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  "1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
