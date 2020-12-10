import 'package:dart_avancado_desafio/models/cidade_model.dart';
import 'package:dart_avancado_desafio/models/estado_model.dart';
import 'package:dart_avancado_desafio/services/cidade_service.dart';
import 'package:dart_avancado_desafio/services/estado_service.dart';
import 'package:mysql1/mysql1.dart';

void run() async {
  print('Desafio dart avançado');

  await createTableEstados();
  await createTableCidades();

  await limparTabelaCidades();
  await limparTabelaEstados();

  var estadoService = EstadoService();

  var estados = await estadoService.fetch();

  var cidadeService = CidadeService();

  await estados.forEach((e) async {
    await inserirEstado(e);

    var cidades = await cidadeService.fetch(e.id);

    var batch = '';
    for (var i = 0; i < cidades.length; i++) {
      var cidade = cidades[i];
      var nome = cidade.nome.replaceAll("'", '');
      var str = '(${cidade.id}, \'$nome\', ${cidade.estado.id})';
      if (i == cidades.length - 1) {
        batch += '$str;\n';
      } else {
        batch += '$str, \n';
      }
    }
    print('Inserindo cidades do estado ${e.nome}');
    await inserirCidadeBatch(batch);
  });
}

Future<MySqlConnection> getConnection() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'root',
      db: 'dart_avancado_desafio');
  return await MySqlConnection.connect(settings);
}

Future<bool> createTableEstados() async {
  print('Criando a tabela de estados');
  var conn = await getConnection();
  var result = await conn.query('''create table if not exists estados(
    id int primary key auto_increment,
    nome varchar(60) not null,
    sigla varchar(2) not null  
  )''');
  var back = result.affectedRows > 0;
  await conn.close();
  if (back) {
    print('Tabela de estados criada com sucesso');
  }
  return back;
}

Future<void> limparTabelaEstados() async {
  var conn = await getConnection();
  await conn.query('delete from estados');
  await conn.close();
}

Future<void> inserirEstado(EstadoModel estado) async {
  print('Inserindo estado: ${estado.nome} - ${estado.sigla}');
  var conn = await getConnection();
  await conn.query('insert into estados (id, nome, sigla) values (?, ?, ?)',
      [estado.id, estado.nome, estado.sigla]);

  await conn.close();
}

Future<void> createTableCidades() async {
  print('Criando a tabela de cidades');
  var conn = await getConnection();
  var result = await conn.query('''create table if not exists cidades(
    id int primary key auto_increment,
    nome varchar(60) not null,
    estado_id int not null,

    foreign key (estado_id) references estados(id)  
  )''');
  var back = result.affectedRows > 0;
  await conn.close();
  if (back) {
    print('Tabela de cidades criada com sucesso');
  }
}

Future<void> limparTabelaCidades() async {
  var conn = await getConnection();
  await conn.query('delete from cidades');
  await conn.close();
}

Future<void> inserirCidade(CidadeModel cidade) async {
  print('Inserindo cidade: ${cidade.nome} - ${cidade.estado.nome}');
  var conn = await getConnection();
  await conn.query('insert into cidades (id, nome, estado_id) values (?, ?, ?)',
      [cidade.id, cidade.nome, cidade.estado.id]);
  await conn.close();
}

Future<void> inserirCidadeBatch(String batch) async {
  var conn = await getConnection();
  await conn.query('insert into cidades (id, nome, estado_id) values $batch');
  await conn.close();
}
