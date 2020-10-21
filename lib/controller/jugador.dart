import 'package:avion_ss/controller/respuesta_turno.dart';

class Jugador {
  bool desbloqueado;
  String nombre;
  int numBloqueado;
  List<int> listaRecorrido;
  List<int> listaRecorridoIda;
  List<int> listaRecorridoVuelta;

  String ida1 = "1,2,3,4,5,6,7,8,9,10,";
  String ida2 = "1,2,3,4,5,6,8,7,9,10,";
  String ida3 = "1,2,3,5,4,6,7,8,9,10,";
  String ida4 = "1,2,3,5,4,6,8,7,9,10,";

  String vuelta1 = "9,8,7,6,5,4,3,2,1,";
  String vuelta2 = "9,8,7,6,4,5,3,2,1,";
  String vuelta3 = "9,7,8,6,5,4,3,2,1,";
  String vuelta4 = "9,7,8,6,4,5,3,2,1,";

  Jugador(String nombre) {
    this.desbloqueado = false;
    this.nombre = nombre;
    this.numBloqueado = 1;
    this.listaRecorridoIda = new List<int>();
    this.listaRecorridoVuelta = new List<int>();
  }

  List<int> findAll(List<int> array, int search) {
    List<int> res = new List<int>();
    for (int i = 0; i < array.length; i++) {
      if (array[i] == search) {
        res.add(array[i]);
      }
    }
    return res;
  }

  RespuestaTurno jugarTurno(int pisada) {
    RespuestaTurno res = RespuestaTurno.error;

    int posIda1 = ida1.indexOf((numBloqueado.toString() + ","));
    int posIda2 = ida2.indexOf((numBloqueado.toString() + ","));
    int posIda3 = ida3.indexOf((numBloqueado.toString() + ","));
    int posIda4 = ida4.indexOf((numBloqueado.toString() + ","));

    int longitud = numBloqueado == 10 ? 3 : 2;

    String subIda1 = numBloqueado == 10
        ? ida1
        : ida1.replaceRange(posIda1, posIda1 + longitud, '');
    String subIda2 = numBloqueado == 10
        ? ida2
        : ida2.replaceRange(posIda2, posIda2 + longitud, '');
    String subIda3 = numBloqueado == 10
        ? ida3
        : ida3.replaceRange(posIda3, posIda3 + longitud, '');
    String subIda4 = numBloqueado == 10
        ? ida4
        : ida4.replaceRange(posIda4, posIda4 + longitud, '');

    // obligar a que el primer salto sea en la primera posicion del listado de ida
    int initIda1 = int.parse(subIda1[0].toString());
    if (listaRecorridoIda.length == 0 && initIda1 == pisada) {
      listaRecorridoIda.add(pisada);
      res = RespuestaTurno.correcto;
    } else if (listaRecorridoIda.length > 0 && listaRecorridoIda.length <= 8) {
      listaRecorridoIda.add(pisada);
      String temp = '';

      for (int i = 0; i < listaRecorridoIda.length; i++) {
        temp += listaRecorridoIda[i].toString() + ",";
      }

      if (subIda1.contains(temp) ||
          subIda2.contains(temp) ||
          subIda3.contains(temp) ||
          subIda4.contains(temp)) {
        res = RespuestaTurno.correcto;
      } else {
        res = RespuestaTurno.error;
      }
    }
    // obligar a que el primer salto sea en la primera posicion del listado de vuelta
    else if (listaRecorridoIda.length == 9 &&
        listaRecorridoVuelta.length == 0) {
      if (this.numBloqueado != 10 || this.desbloqueado) {
        if (pisada == 9) {
          listaRecorridoVuelta.add(pisada);
          res = RespuestaTurno.correcto;
        }
      } else {
        if (pisada == 10) {
          this.desbloqueado = true;
          res = RespuestaTurno.correcto;
        }
      }
    } else if (listaRecorridoIda.length == 9 &&
        listaRecorridoVuelta.length > 0 &&
        listaRecorridoVuelta.length <= 8) {
      listaRecorridoVuelta.add(pisada);
      String temp = '';

      for (int i = 0; i < listaRecorridoVuelta.length; i++) {
        temp += listaRecorridoVuelta[i].toString() + ",";
      }

      if (numBloqueado == 4 || numBloqueado == 5) {
        res = rutaPosible(vuelta1, vuelta3, temp);
      } else if (numBloqueado == 7 || numBloqueado == 8) {
        res = rutaPosible(vuelta1, vuelta2, temp);
      } else {
        if (vuelta1.contains(temp) ||
            vuelta2.contains(temp) ||
            vuelta3.contains(temp) ||
            vuelta4.contains(temp)) {
          if (vuelta1.length == temp.length ||
              vuelta2.length == temp.length ||
              vuelta3.length == temp.length ||
              vuelta4.length == temp.length) {
            if (numBloqueado == 10) {
              res = RespuestaTurno.fin;
            } else {
              res = RespuestaTurno.avanzar;
              numBloqueado++;
            }
          } else {
            res = RespuestaTurno.correcto;
          }
        } else {
          res = RespuestaTurno.error;
        }
      }
    }

    if (res == RespuestaTurno.error || res == RespuestaTurno.avanzar) {
      listaRecorridoIda.clear();
      listaRecorridoVuelta.clear();
      this.desbloqueado = false;
    }

    return res;
  }

  RespuestaTurno rutaPosible(String vuelta1, vuelta2, temp) {
    RespuestaTurno res;
    if (vuelta1.contains(temp) || vuelta2.contains(temp)) {
      if (vuelta1.length == temp.length || vuelta2.length == temp.length) {
        if (numBloqueado == 10) {
          res = RespuestaTurno.fin;
        } else {
          res = RespuestaTurno.avanzar;
          numBloqueado++;
        }

        listaRecorridoIda.clear();
        listaRecorridoVuelta.clear();
      } else {
        res = RespuestaTurno.correcto;
      }
    } else {
      res = RespuestaTurno.error;
      listaRecorridoIda.clear();
      listaRecorridoVuelta.clear();
    }

    return res;
  }

  void reiniciar() {
    this.desbloqueado = false;
    this.numBloqueado = 1;
    this.listaRecorridoIda = new List<int>();
    this.listaRecorridoVuelta = new List<int>();
  }
}
