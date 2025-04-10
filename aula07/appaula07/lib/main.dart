// biblioteca flutter material permite criar os widgets para app 
// no android
import 'package:flutter/material.dart';

// voi main funçao principal do codigo
void main() {
  // runApp funçao que chama a classe do app
  runApp(Telaapp());
}
class Telaapp extends StatelessWidget {
  const Telaapp({super.key});

 // polimorfismo que permite tratar objetos de diferentes formas
  @override
  // Widget build metodo que ira construir nossa tela
  Widget build(BuildContext context) {
    // MaterialApp vai permitir construir a tela do app
    return MaterialApp(
      //retira o modo debug
      debugShowCheckedModeBanner: false,
      home: Column(
        //espaçamento primeirio
        //mainAxisAlignment:MainAxisAlignment.center, 
        //mainAxisAlignment: MainAxisAlignment.start, 
        // mainAxisAlignment: MainAxisAlignment.end, 
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
        mainAxisAlignment: MainAxisAlignment.spaceAround, 
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,

        
      children: [

         Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 200,height: 100,color: Colors.blue,),
            Container(width: 200,height: 80,color: Colors.red,
            child: Text("Senai",textAlign: TextAlign.center, style: TextStyle(color: Colors.white,
            decoration: TextDecoration.none, ),
            ),
            ),
          ],
        ),

        Container(width: 200,height: 200,color: Colors.blue,),
        Text("Mobile 1 - Flutter",style: TextStyle(fontSize: 24,decoration: TextDecoration.none), ),
        Container(width: 200,height: 200,color: Colors.red,),
        ElevatedButton(onPressed: (){
          print("Botao pressionado");
        }, child: Text("Mensagem")),


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
          children: [
            Container(width: 50,height: 50,color: Colors.yellow,),
            Container(width: 50,height: 50,color: const Color.fromARGB(255, 255, 59, 255),),
            Container(width: 50,height: 50,color: const Color.fromARGB(255, 59, 255, 69),),
          ],
        )
      ],
      ),
    );
  }
}