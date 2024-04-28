import 'dart:convert';
import 'package:uplace/application/services/interfaces/baseService.dart';
import 'package:uplace/models/teste.dart';
import 'package:http/http.dart' as http;

class TesteService extends BaseService {
  TesteService();

  Future<List<Teste>?> obterTeste() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.15:5000/api/teste'));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body) as List<dynamic>;
      var testes = List<Teste>.empty(growable: true);
      result.forEach(
        (e) {
          testes.add(Teste.FromJson(e as Map<String, dynamic>));
        },
      );
      return testes;
    } else {
      return null;
    }
  }
}
