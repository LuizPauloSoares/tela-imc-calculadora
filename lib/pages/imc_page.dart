import 'package:flutter/material.dart';

class imcpage extends StatefulWidget{
  const imcpage({super.key});

  @override
  State<imcpage> createState() => _tela_imc();
}
class _tela_imc extends State<imcpage> {
  final TextEditingController _peso = TextEditingController();
  final TextEditingController _altura = TextEditingController();
  String resultado = '';

void limparCampo(){
double? peso = double.tryParse(_peso.text);
double? altura = double.tryParse(_altura.text);
_peso.clear();
_altura.clear();

if(peso == null || altura == null){
  setState(() {
    resultado = "nenhum campo preenchido";
  });
}
}

void calculo_imc(){
  double? peso = double.tryParse(_peso.text);
  double? altura = double.tryParse(_altura.text);

  if(peso == null || altura == null){
    setState(() {
      resultado = "nenhum campo preenchido";
    });
    return;
  }
  double imc = peso/(altura * altura);
  String simc =imc.toStringAsFixed(2);


  if (imc<=18.5){
    setState(() {
      resultado = "Abaixo do peso \n IMC de  :$simc ";
    });
  }
  else if (imc > 18.5 || imc <= 24.9){
    setState(() {
      resultado = "Peso normal \n IMC de  :$simc ";
    });
  }
  else if (imc >= 25.0 || imc <= 29.9){
    setState(() {
      resultado = "Sobrepeso \n IMC de  :$simc ";
    });
  }
  else if (imc >= 30.0 || imc <= 34.9){
    setState(() {
      resultado = "Obesidade grau I \n IMC de  :$simc ";
    });
  }
  else if (imc >= 35.0 || imc <= 39.9){
    setState(() {
      resultado = "Obesidade grau II \n IMC de  :$simc ";
    });
  }
  else{
    setState(() {
      resultado = "Obesidade grau III \n IMC de  :$simc ";
    });
  }


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.calculate),
        title: const Text('IMC'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.black87,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [

            const Icon(
              Icons.monitor_weight,
              size: 150,
              color: Colors.deepPurpleAccent,
            ),

            const SizedBox(height: 8),

            //alterar o text
            const Text(
              'informe seu peso e altura para calcular o IMC',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: _peso,
              decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 300),
                prefixIcon: Icon(Icons.monitor_weight,
                    color:Colors.grey),
                labelText: 'peso em KG',
                border: OutlineInputBorder(),

              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: _altura,
              decoration: const InputDecoration(
                constraints: BoxConstraints(maxWidth: 300),
                prefixIcon: Icon(Icons.height,
                    color:Colors.grey),
                labelText: 'altura em metros',
                border: OutlineInputBorder(),

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
                label: const Text('calcular IMC',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: (){
                  calculo_imc();
                },
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: 275,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent.shade100,
                  foregroundColor: Colors.black87,
                  disabledBackgroundColor: Colors.deepPurpleAccent.shade100,
                  disabledForegroundColor: Colors.black87,
                ),
                icon: const Icon(Icons.delete),
                label: const Text('Limpar Tela',
                  style: TextStyle(fontSize: 18),
                ),
                onPressed: (){
                  limparCampo();
                },
              ),
            ),

            Container(
              width: 275,
              padding: const EdgeInsets.all(30),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child:  Text(resultado),

            ),

          ],
        ),
      ),
    );
  }
}