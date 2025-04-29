import 'package:flutter/material.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
import '../../../service/post_candidato.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Controladores para os campos de texto
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dataDeNascimentoController = TextEditingController();

  // Substitua estas variáveis pelos seus serviços reais
  final candidatoService = CandidatoService();
  

  // Método para salvar os dados
  Future<void> salvarDados() async {
    final dadosCandidato = {
      'nome': nomeController.text,
      'email': emailController.text,
      'telefone': telefoneController.text,
      'cpf': cpfController.text,
      //'dataDeNascimento': dataDeNascimentoController.text,
    };

    try {
      print("Enviando dados para CandidatoService: $dadosCandidato");
      await candidatoService.enviarPost(dadosCandidato);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Perfil salvo com sucesso!')),
      );

      // Limpar os campos após salvar
      nomeController.clear();
      emailController.clear();
      telefoneController.clear();
      cpfController.clear();
      dataDeNascimentoController.clear();
      setState(() {
        // Atualize os estados necessários
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar dados: $e')),
      );
    }
  }

  @override
  void dispose() {
    // Dispose dos controladores para liberar recursos
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    cpfController.dispose();
    dataDeNascimentoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dados Pessoais'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('Nome'),
                  ),
                  TextFormFieldWrapper(
                    formField: TextFormField(
                      controller: nomeController,
                      decoration: const InputDecoration(border: InputBorder.none),
                      style: const TextStyle(color: Colors.black), 
                    ),
                    position: TextFormFieldPosition.alone,
                  ),

                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('E-mail'),
                  ),
                  TextFormFieldWrapper(
                    formField: TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(border: InputBorder.none),
                      style: const TextStyle(color: Colors.black), 

                    ),
                    position: TextFormFieldPosition.alone,
                  ),

                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('Telefone'),
                  ),
                  TextFormFieldWrapper(
                    formField: TextFormField(
                      controller: telefoneController,
                      decoration: const InputDecoration(border: InputBorder.none),
                      style: const TextStyle(color: Colors.black), 
                    ),
                    position: TextFormFieldPosition.alone,
                  ),

                  const SizedBox(height: 20),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                    child: Text('CPF'),
                  ),
              //  TextFormFieldWrapper(
              //       formField: TextFormField(
              //         controller: cpfController,
              //         decoration: const InputDecoration(border: InputBorder.none),
              //       ),
              //       position: TextFormFieldPosition.alone,
              //     ),

              //     const SizedBox(height: 20),

              //     const Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
              //       child: Text('Data de nascimento'),
              //     ),
                  TextFormFieldWrapper(
                    formField: TextFormField(
                      controller: cpfController,
                      decoration: const InputDecoration(border: InputBorder.none),
                      style: const TextStyle(color: Colors.black), 
                    ),
                    position: TextFormFieldPosition.alone,
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: salvarDados,
                      child: const Text('Cadastrado'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Classes fictícias para representar os serviços
class ProfileService {
  Future<void> dadosCandidato(Map<String, String> dados) async {
    // Implemente a lógica para enviar os dados do candidato
  }
}

class IntencoesService {
  Future<void> intecoesPost(Map<String, String> dados) async {
    // Implemente a lógica para enviar as intenções
  }
}
