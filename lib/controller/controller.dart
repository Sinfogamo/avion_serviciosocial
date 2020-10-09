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
        showDialog(
          context: navigatorKey.currentState.overlay.context,
          builder: (context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: new Text("¡Te has equivocado!"),
              content: new Text(this.jugadorActual.nombre + " es tu turno."),
            );
          },
        );
        break;
      case RespuestaTurno.avanzar:
        this.cambiarTurno();
        showDialog(
          context: navigatorKey.currentState.overlay.context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 2), () {
              Navigator.of(context).pop(true);
            });
            return AlertDialog(
              title: new Text("Cambio de Turno"),
              content: new Text(this.jugadorActual.nombre + " es tu turno"),
            );
          },
        );
        break;
      case RespuestaTurno.fin:
        showDialog(
          context: navigatorKey.currentState.overlay.context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: new Text("Juego Terminado"),
              content: new Text(this.jugadorActual.nombre + " gano."),
              actions: <Widget>[
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
    for (int i = 0; i < this.jugadoresList.length; i++) {
      this.jugadoresList[i].reiniciar();
    }
    this.jugadorActual = this.jugadoresList.first;
    lbJugador = this.jugadorActual.nombre;
    lbNumero = this.jugadorActual.numBloqueado.toString();
    this.ponerPiedrita(0);
  }
}
