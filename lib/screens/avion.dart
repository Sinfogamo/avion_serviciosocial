import 'package:avion_ss/controller/controller.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvionPage extends StatefulWidget {
  String numJugadores;
  AvionPage(this.numJugadores);

  @override
  _AvionPageState createState() => _AvionPageState(numJugadores);
}

class _AvionPageState extends State<AvionPage> {
  Controller control;
  String nombre, numBloqueado, numJugadores;

  _AvionPageState(this.numJugadores);
  @override
  void initState() {
    super.initState();
    control = new Controller(int.parse(numJugadores));
    nombre = "jugador";
    numBloqueado = "0";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Juego del Avion"),
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
                minWidth: 100.0,
                height: 100.0,
                child: RaisedButton(
                  onPressed: () {
                    control.leerPisada(10);
                    setState(() {});
                  },
                  color: control.colorear(10) ? Colors.grey : Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    "10",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(9);
                  setState(() {});
                },
                color: control.colorear(9) ? Colors.grey : Colors.blue,
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
                    color: control.colorear(8) ? Colors.grey : Colors.green,
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
                    color: control.colorear(7) ? Colors.grey : Colors.green,
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
                color:
                    control.colorear(6) ? Colors.grey : Colors.deepOrangeAccent,
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
                    color: control.colorear(5) ? Colors.grey : Colors.green,
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
                    color: control.colorear(4) ? Colors.grey : Colors.green,
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
                color: control.colorear(3) ? Colors.grey : Colors.yellow,
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
                color: control.colorear(2) ? Colors.grey : Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Text(
                  "2",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  control.leerPisada(1);
                  setState(() {});
                },
                color:
                    control.colorear(1) ? Colors.grey : Colors.deepOrangeAccent,
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
