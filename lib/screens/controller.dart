import 'package:flutter/material.dart';

import '../main.dart';
import 'jugador.dart';
import 'respuesta_turno.dart';

String lbJugador;
String lbNumero;

class Controller {
  Jugador jugadorActual;
  List<Jugador> jugadoresList = new List<Jugador>();
  int piedrita;

  Controller(int jugadores) {
    for (int i = 0; i < jugadores; i++) {
      this.jugadoresList.add(new Jugador(
          "Jugador" + (i + 1).toString())); //agregar nombres de jugadores
    }
    this.iniciar();
  }

  void leerPisada(int pisada) {
    switch (this.jugadorActual.jugarTurno(pisada)) {
      case RespuestaTurno.correcto:
        if (pisada == this.jugadorActual.numBloqueado) {
          this.ponerPiedrita(pisada);
        }
        break;
      case RespuestaTurno.error:
        this.cambiarTurno();
        break;
      case RespuestaTurno.avanzar:
        this.cambiarTurno();
        break;
      case RespuestaTurno.fin:
        showDialog(
          context: navigatorKey.currentState.overlay.context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              title: new Text("Alert Dialog title"),
              content: new Text(
                  "El jugador: " + this.jugadorActual.nombre + " gano."),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                new FlatButton(
                  child: new Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                    this.iniciar();
                  },
                ),
              ],
            );
          },
        );
        break;
    }
  }

  void ponerPiedrita(int numero) //crear metodo botones cambiar color
  {
    piedrita = numero == 0 ? jugadorActual.numBloqueado : -1;
  }

  bool colorear(int x) {
    return x == piedrita;
  }

  void cambiarTurno() {
    for (int i = 0; i < this.jugadoresList.length; i++) {
      if (this.jugadorActual == this.jugadoresList[i]) {
        if (i + 1 <= this.jugadoresList.length - 1) {
          this.jugadorActual = this.jugadoresList[i + 1];
        } else {
          this.jugadorActual = this.jugadoresList.first;
        }
        break;
      }
    }
    lbJugador = jugadorActual.nombre;
    lbNumero = jugadorActual.numBloqueado.toString();
    this.ponerPiedrita(0);
  }

  void iniciar() {
    // ignore: unused_element
    for (int i = 0; i < this.jugadoresList.length; i++) {
      this.jugadoresList[i].reiniciar();
    }
    this.jugadorActual = this.jugadoresList.first;
    lbJugador = this.jugadorActual.nombre;
    lbNumero = this.jugadorActual.numBloqueado.toString();
    this.ponerPiedrita(0);
  }
}
