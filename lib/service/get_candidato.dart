import 'dart:convert';
import 'package:http/http.dart' as http;

class CandidatoService {
  Future<dynamic> fetchCandidato() async {
    final response = await http.get(
      Uri.parse('http://192.168.0.100:8080/api/cadastro'), // Substitua pela URL correta do seu backend
      headers: <String, String>{
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      // Decodifica a resposta JSON
      return jsonDecode(response.body);
    } else {
      // Lança uma exceção com o corpo da resposta em caso de erro
      throw Exception('Erro ao carregar candidato: ${response.body}');
    }
  }
}





