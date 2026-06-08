import 'package:flutter/material.dart';

class OperacoesPage extends StatefulWidget{
  const OperacoesPage({super.key});

  @override
  State<OperacoesPage> createState() => _tela_operacoes();
}
class _tela_operacoes extends State<OperacoesPage>{
  final TextEditingController _pergunta = TextEditingController();
  final TextEditingController _pergunta2 = TextEditingController();
  String resultado = '';

  void limparCampo(){
    double? num1 = double.tryParse(_pergunta.text);
    double? num2 = double.tryParse(_pergunta2.text);
    _pergunta.clear();
    _pergunta2.clear();

    if(num1 == null || num2 == null){
      setState(() {
        resultado = "nenhum campo preenchido";
      });
    }
  }

  void calcular(String operacao){
    double? num1 = double.tryParse(_pergunta.text);
    double? num2 = double.tryParse(_pergunta2.text);

    if(num1 == null || num2 == null){
      setState(() {
        resultado = "nenhum campo preenchido";
      });
      return;
    }
    double res;

    if(operacao == "+"){
      res = num1 + num2;
      setState(() {
        resultado = "o resultado e $res";
      });
    }
    else if(operacao == "-"){
      res = num1 - num2;
      setState(() {
        resultado = "o resultado e $res";
      });
    }
    else if(operacao == "X"){
      if(num2 < 0){
        setState(() {
          resultado = 'nao e possivel multiplicar ';
        });
      }
      else{
        res = num1 * num2;

        setState(() {
          resultado = "o resultado e $res";
        });
      }
    }
    else if(operacao == "%"){
      if(num2 <= 0){
        setState(() {
          resultado = 'nao e possivel dividir ';
        });
      }
      else{
        res = num1 / num2;

        setState(() {
          resultado = "o resultado e $res";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(Icons.functions),
        title: const Text('Operações Matematicas'),
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.black87,
      ),


        body: Center(
          child: Column(
              mainAxisAlignment: .center,
                children: [

                  const SizedBox(height: 8),

                  const Icon(
                    Icons.functions,
                    size: 100,
                    color: Colors.deepPurpleAccent,
                  ),

                  const SizedBox(height: 8),

                  //alterar o text
                  const Text(
                    'Calculo Matematico',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _pergunta,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 300),
                      prefixIcon: Icon(Icons.looks_one_rounded,
                      color:Colors.grey),
                      labelText: 'Digite um numero',
                      border: OutlineInputBorder(),

                    ),
                  ),

                  const SizedBox(height: 16),

                  TextField(
                    controller: _pergunta2,
                    decoration: const InputDecoration(
                      constraints: BoxConstraints(maxWidth: 300),
                      prefixIcon: Icon(Icons.looks_two,
                          color:Colors.grey),
                      labelText: 'Digite outro numero',
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
                      icon: const Icon(Icons.add),
                      label: const Text('soma',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: (){
                        calcular("+");
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
                      icon: const Icon(Icons.remove),
                      label: const Text('Subitração',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: (){
                        calcular("-");
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
                      icon: const Icon(Icons.close),
                      label: const Text('Multiplicação',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: (){
                        calcular("X");
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
                      icon: const Icon(Icons.percent),
                      label: const Text('Divisão',
                        style: TextStyle(fontSize: 18),
                      ),
                      onPressed: (){
                        calcular("%");
                      },
                    ),
                  ),

                  const SizedBox(height:16),

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

                  const SizedBox(height: 16),

                  Container(
                    width: 275,
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:  Text(resultado),

                  ),

                ]
          ),
        ),
    );
  }
}