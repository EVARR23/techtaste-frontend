import 'package:flutter/material.dart';
import 'package:text_form_field_wrapper/text_form_field_wrapper.dart';
import 'dart:convert';
import '../../../service/post_candidato.dart';
import '../../../service/get_candidato.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController dataDeNascimentoController = TextEditingController();

  final candidatoService = CandidatoService();

  @override
  void initState() {
    super.initState();
    carregarCadastro(); // Correto: initState chama a função de carregamento
  }

  Future<void> carregarCadastro() async {
    final responseBody = await getCadastros();
    if (responseBody != null) {
      try {
        final dados = jsonDecode(responseBody);
        final json = (dados is List) ? dados.first : dados;

        setState(() {
          nomeController.text = json['nome'] ?? '';
          emailController.text = json['email'] ?? '';
          telefoneController.text = json['telefone'] ?? '';
          cpfController.text = json['cpf'] ?? '';
          dataDeNascimentoController.text = json['dataDeNascimento'] ?? '';
        });
      } catch (e) {
        print('Erro ao decodificar JSON: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar dados')),
      );
    }
  }

  Future<void> salvarDados() async {
    final dadosCandidato = {
      'nome': nomeController.text,
      'email': emailController.text,
      'telefone': telefoneController.text,
      'cpf': cpfController.text,
      'dataDeNascimento': dataDeNascimentoController.text,
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

      setState(() {});
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao salvar dados: $e')),
      );
    }
  }

  @override
  void dispose() {
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
                  _buildCampo('Nome', nomeController),
                  _buildCampo('E-mail', emailController),
                  _buildCampo('Telefone', telefoneController),
                  _buildCampo('CPF', cpfController),
                  _buildCampo('Data de nascimento', dataDeNascimentoController),
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

  Widget _buildCampo(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
          child: Text(label),
        ),
        TextFormFieldWrapper(
          formField: TextFormField(
            controller: controller,
            decoration: const InputDecoration(border: InputBorder.none),
            style: const TextStyle(color: Colors.black),
          ),
          position: TextFormFieldPosition.alone,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
