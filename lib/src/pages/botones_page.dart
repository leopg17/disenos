import 'package:flutter/material.dart';


import 'dart:math';
import 'dart:ui';


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
                _botonesRedondeados(),

              ]
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
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
            Text('Classify Transaction', 
              style: TextStyle(color: Colors.white, fontSize: 28.0, fontWeight: FontWeight.bold),
            ),
            SizedBox( height: 10.0),
            Text('Classify this transaction into a particular category', 
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context){
    return  Theme(
      data: Theme.of(context).copyWith(
        // Aqui ponemos todos los colores y personalizaciones
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))
      ), 
      child: BottomNavigationBar( //Lo que voy a mostrar realmente
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart, size: 30.0),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container()
          ),
        ]
        ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children:[ // Los tableRow deben de tener la misma cantidad de elementos
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.lightBlue, Icons.dashboard, 'General'),
            _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, 'Transport'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.pinkAccent, Icons.shopping_basket, 'Shopping'),
            _crearBotonRedondeado(Colors.orangeAccent, Icons.receipt, 'Bills'),
          ]
        ),
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blueAccent, Icons.movie,'Entertaiment'),
            _crearBotonRedondeado(Colors.greenAccent, Icons.fastfood, 'Grocery'),
          ]
        ),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icon, String text) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: 160.0,
          margin: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(15.0)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(height:5.0),
              CircleAvatar(
                backgroundColor: color,
                radius: 35.0,
                child: Icon(icon, color: Colors.white,),
              ),
              Text(text, style: TextStyle(color: color)),  
              SizedBox(height:5.0),
            ]
          ),
        ),
      ),
    );
  }
}