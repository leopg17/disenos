import 'dart:math';

import 'package:flutter/material.dart';

class BotonesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //Funciona como un naipe de cartas, como si estuviera una encima de otra.
        children: <Widget>[
          _fondoApp(),

          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),

              ]
            ),
          )
        ],
      )
    );
  }

  Widget _fondoApp() {

    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          // Funciona por coordenadas, arriba izquierda X:0.0, y:0.0
          // Arriba derecha, X:1.0, y:0.0
          // Abajo izquierda, X:0.0, Y:1.0
          // Abajo derecha, X:1.0, y:1.0
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      ),
    );

    final cajaRosa = Transform.rotate(

      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]
          )

        ),
      ),
    ); 
    
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          // Me permite posicionar un widget en un punto exacto
          top: -100,
          left: -50,
          child: cajaRosa

        )
      ],
    );

  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify Transaction', style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),),
            SizedBox( height: 10.0),
            Text('Classify this transaction into a particular category', style: TextStyle(color: Colors.white, fontSize: 18.0),)
          ],
        ),
      ),
    );
  }
}