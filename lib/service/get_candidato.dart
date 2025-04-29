// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;

Future<dynamic> getCadastros() async {
  try {
    final response = await http.get(Uri.parse('http://192.168.0.100:8080/api/cadastro'));
    if (response.statusCode == 200) {
      print(response.body); 
      return response.body;
    } else {
      throw Exception('Erro ao buscar dados');
    }
  } catch (error) {
    print(error);
    return null;
  }
}




