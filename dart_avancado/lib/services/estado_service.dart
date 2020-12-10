import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dio/dio.dart';

class EstadoService {
  Dio _dio;

  EstadoService() {
    _dio = Dio();
  }

  Future<List<EstadoModel>> fetch() async {
    var response = await _dio
        .get('https://servicodados.ibge.gov.br/api/v1/localidades/estados');
    if (response.statusCode != 200) {
      throw Exception('Ocorreu um erro ao tentar recuperar os estados');
    }
    var data = response.data as List;
    var estados = data.map((e) => EstadoModel.fromMap(e)).toList();
    return estados;
  }
}
