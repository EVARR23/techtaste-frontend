import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutRequestExample extends StatefulWidget {
  @override
  _PutRequestExampleState createState() => _PutRequestExampleState();
}

class _PutRequestExampleState extends State<PutRequestExample> {
  final TextEditingController emailController = TextEditingController();

  Future<void> sendPutRequest() async {
    final url = Uri.parse('http://localhost:8080/api/cadastro/update'); // URL da sua API
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'email': emailController.text,
      // Adicione outros campos se necessário
    });

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // A requisição foi bem-sucedida
        print('Requisição PUT bem-sucedida!');
      } else {
        // A requisição falhou
        print('Erro ao enviar PUT: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  
}

