import 'package:flutter/material.dart';



class Mypantalla2 extends StatelessWidget {
  const Mypantalla2({Key? key, required this.mensaje,required this.edad}) : super(key: key);

  final String mensaje;
  final String edad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Demo Page 2'),
      ),
      body: MyPantallaPage(title: 'Flutter Demo Page 2', mensaje: mensaje,edad:edad),
    );
  }
}


class MyPantallaPage extends StatefulWidget{
  const MyPantallaPage({Key? key, required this.title, required this.mensaje,required this.edad}) : super(key: key);

  final String title;
  final String mensaje;
  final String edad;



  @override
  State<MyPantallaPage> createState() => _MyHomePantallaPageState();


}


class _MyHomePantallaPageState extends State<MyPantallaPage> {

  String image ='';

  void _updateImage() {
    setState(() {
      if(int.parse(widget.edad)<18){
        image =  "assets/images/buscar.png";
      }else{
        image =  "assets/images/logout.png";
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    _updateImage();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset(image),
            ),
            Text('hola' + widget.mensaje),
            Text(widget.edad),
          ],
        ),
      ),
    );
  }
}





