import 'package:flutter/material.dart';
import 'pages/tela_inicio.dart';

void main() {

  runApp(const Meuapp());
}

class Meuapp extends StatelessWidget {

  const Meuapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Projeto UC12',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(primarySwatch: Colors.indigo,

        useMaterial3: true,
      ),
      home: const Telainicio(),
    );
  }
}