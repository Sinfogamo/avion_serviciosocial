import 'respuesta_turno.dart';

class Jugador{
  String nombre;
  int numBloqueado;
  List<int> listaRecorrido;

  Jugador(String nombre){
    this.nombre = nombre;
    this.numBloqueado = 1;
    this.listaRecorrido = new List<int>();
  }

  List<int> findAll(List<int> array, int search){
    List<int> res = new List<int>();
    for (int i = 0; i < array.length; i++)
    {
        if (array[i] == search)
        {
            res.add(array[i]);
        }
    }
    return res;
  }

  RespuestaTurno jugarTurno(int pisada){
    RespuestaTurno res = RespuestaTurno.error;
    if (this.listaRecorrido.length > 0){
      if (this.listaRecorrido.length >= 9){
        int salto;
        salto = this.listaRecorrido.last == 9 && findAll(this.listaRecorrido, 9).length == 1 && this.numBloqueado == 10 ? 1 : -1;
        if (pisada == this.listaRecorrido.last + salto){
          if (this.listaRecorrido.length == 17){
            if (this.numBloqueado < 10){
              this.listaRecorrido.clear();
              this.numBloqueado++;
              res = RespuestaTurno.avanzar;
            }
            else{
              this.listaRecorrido.add(pisada);
              res = RespuestaTurno.correcto;
            }
          }
          else if (this.listaRecorrido.length == 18){
            this.listaRecorrido.clear();
            this.numBloqueado = 1;
            res = RespuestaTurno.fin;
          }
          else{
            this.listaRecorrido.add(pisada);
            res = RespuestaTurno.correcto;
          }
        }
        else{
          res = RespuestaTurno.error;
          this.listaRecorrido.clear();
        }
      }
      else{
        int salto = this.listaRecorrido.last + 1 == this.numBloqueado ? 2 : 1;
        if (pisada == this.listaRecorrido.last + salto && pisada != this.numBloqueado){
          this.listaRecorrido.add(pisada);
          res = RespuestaTurno.correcto;
        }
        else if (pisada < this.listaRecorrido.last || pisada > this.listaRecorrido.last + 1 || pisada == this.numBloqueado){
          res = RespuestaTurno.error;
          this.listaRecorrido.clear();
        }
      }
    }
    else
    {
      if (this.numBloqueado == 1){
        if (pisada == this.numBloqueado + 1){
          this.listaRecorrido.add(pisada);
          res = RespuestaTurno.correcto;
        }
        else{
          res = RespuestaTurno.error;
          this.listaRecorrido.clear();
        }
      }
      else
      {
        if (pisada == 1){
          this.listaRecorrido.add(pisada);
          res = RespuestaTurno.correcto;
        }
        else{
          res = RespuestaTurno.error;
          this.listaRecorrido.clear();
        }
      }
    }
    return res;
  }

  void reiniciar()
  {
      this.numBloqueado = 1;
      this.listaRecorrido = new List<int>();
  }
}