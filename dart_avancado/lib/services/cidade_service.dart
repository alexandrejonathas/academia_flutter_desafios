import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dio/dio.dart';

class CidadeService {
  Dio _dio;

  CidadeService() {
    _dio = Dio();
  }

  Future<List<CidadeModel>> fetch(int estadoId) async {
    var url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$estadoId/distritos';
    var response = await _dio.get(url);
    if (response.statusCode != 200) {
      throw Exception('Ocorreu um erro ao tentar recuperar os estados');
    }
    var data = response.data as List;
    var cidades = data.map((e) => CidadeModel.fromMap(e)).toList();
    return cidades;
  }
}
