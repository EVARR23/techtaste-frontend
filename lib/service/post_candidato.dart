import 'dart:convert';

import 'package:http/http.dart' as http;

class CandidatoService {
  final String baseUrl =
      "http://localhost:8080/api/cadastro/add";
    


  Future<void> enviarPost(Map<String, dynamic> dados) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer token_se_necessario',
        },
        body: jsonEncode(dados),
      );

      if (response.statusCode == 200) {
        print("POST enviado com sucesso: ${response.body}");
      } else {
        print("Erro ao enviar POST: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro: $e");
    }
  }
}