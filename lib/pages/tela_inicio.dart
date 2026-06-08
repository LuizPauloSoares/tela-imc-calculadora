import 'package:flutter/material.dart';
import 'operacoes_page.dart';
import 'imc_page.dart';



class Telainicio extends StatelessWidget{
  const Telainicio({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.calculate),
        title: const Text('Projeto Calculadora/IMC'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.black87,

      ),


      body: Center(

          child: Column(


            mainAxisAlignment: .center,
            children: [



              const SizedBox(height: 16),

              const Icon(
                Icons.calculate,
                size: 150,
                color: Colors.deepPurpleAccent,
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: 275,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.black87,
                    disabledBackgroundColor: Colors.deepPurpleAccent,
                    disabledForegroundColor: Colors.black87,
                  ),
                  icon: const Icon(Icons.functions),
                  label: const Text('opercações matematicas',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OperacoesPage()
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                width: 275,
                height: 50,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.black87,
                    disabledBackgroundColor: Colors.deepPurpleAccent,
                    disabledForegroundColor: Colors.black87,
                  ),
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calculo IMC',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const imcpage()
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

            ],
          ),
      ),
    );
  }
}