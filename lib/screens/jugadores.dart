import 'package:avion_ss/screens/avion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class NumJugadores extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Juego del Avion",
          textAlign: TextAlign.center,
        )),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Por favor selecciona el número de jugadores"),
                TextFormField(
                  controller: controller,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value.isEmpty || int.parse(value) <= 0) {
                      return 'por favor ingresa un número mayor a 0';
                    }
                    return null;
                  },
                ),
                RaisedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AvionPage(controller.text)));
                    }
                  },
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    "Seleccionar Jugadores",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            )),
        ),
      ),
    );
  }
}
