
import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          _pagina1(),
          _pagina2()
        ],
      )
    );
  }

  Widget _pagina1() {
    return Stack(
      //Pensar en Stack como si fuera un naipe, unos encima de otros
      children: <Widget>[
        //El orden importa, los primeros con los que estan al fondo, y los ultimos mas arriba
        _colorFondo(),
        _imagenFondo(),
        _textos(),
      ]
    );
  }

  Widget _pagina2() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Center(
        child: RaisedButton(
          shape: StadiumBorder(),
          color: Colors.blueAccent,
          textColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.0, vertical:20.0),
            child: Text('Bienvenidos', style: TextStyle(fontSize:20.0)),
          ),
        onPressed: (){},
        )
      ),

    );
  }

  Widget _colorFondo() {
    return Container(
      width: double.infinity, //Toma todo el ancho posible
      height: double.infinity, //Toma todo el alto posible
      color: Color.fromRGBO(108, 192, 218, 1.0),// La opacidad en 1 significa que es un color solido

    );
  }

  Widget _imagenFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('assets/original.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _textos() {

    final estiloTexto = TextStyle(color:Colors.white, fontSize: 50.0);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0,),
          Text('11°', style: estiloTexto,) ,
          Text('Miercoles', style: estiloTexto,) ,
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white,)
        ],
      ),
    );
  }

  
}