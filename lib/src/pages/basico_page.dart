import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo    = TextStyle( fontSize:20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle( fontSize:18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[

          _crearImagen(),
          
          _crearTitulo(),

          _crearAcciones(),

          _crearTexto(),

        ],
      ),
    );
  }

  Widget _crearImagen(){
    return Image(
      image: NetworkImage('https://www.funbam.org/sites/default/files/2018-06/YNCL_51-1.jpg'),
    );
  }

  Widget _crearTitulo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical:20.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Manuel Antonio', style: estiloTitulo,),
                SizedBox(height:7.0),
                Text('Puntarenas Norte', style: estiloSubtitulo),
              ],
            ),
          ),
          Icon(Icons.star, color:Colors.red, size:30.0, ),
          Text('41', style: TextStyle(fontSize:20.0))
        ],
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
      //mainAxisAlignment acomoda de manera horizontal
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE')
      ],
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon , color: Colors.blue, size: 40.0),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(fontSize: 15.0, color: Colors.blue),)
      ],
    );
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical:20.0),
      child: Text(
        'In laborum exercitation excepteur qui id. Proident irure commodo consectetur ad aliqua nostrud proident est eu officia dolore excepteur. Tempor magna eu est irure enim cillum. Mollit id excepteur amet ad culpa enim. Occaecat exercitation dolor occaecat est amet sunt mollit laboris ex id tempor veniam. Aute Lorem aute incididunt excepteur officia nisi Lorem ipsum exercitation.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}