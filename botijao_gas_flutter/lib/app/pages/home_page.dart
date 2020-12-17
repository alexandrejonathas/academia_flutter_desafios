import 'dart:convert';

import 'package:botijao_gas_flutter/app/models/empresa.dart';
import 'package:botijao_gas_flutter/app/pages/empresa_page.dart';
import 'package:botijao_gas_flutter/app/pages/widgets/empresa_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filtros = [
    'Melhor avaliado',
    'Mais rápido',
    'Mais barato'
  ];

  List<dynamic> empresas;

  @override
  void initState() {
    rootBundle.loadString('assets/dados.json').then((e) {
      setState(() {
        this.empresas = json.decode(e);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Escolha uma revenda'),
        actions: [
          PopupMenuButton(
            icon: Icon(
              Icons.swap_vert,
              size: 30,
            ),
            itemBuilder: (_) {
              return this.filtros.map((f) {
                return PopupMenuItem(
                  value: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(f),
                      Checkbox(onChanged: (bool value) {}, value: false)
                    ],
                  ),
                );
              }).toList();
            },
          ),
          PopupMenuButton(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                '?',
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            itemBuilder: (_) {
              return [
                PopupMenuItem(
                  child: Text(
                    'Suporte',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                PopupMenuItem(
                  child: Text(
                    'Termos de serviços',
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ];
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [
        _topo(),
        Expanded(
          child: _lista(),
        ),
      ],
    );
  }

  Widget _topo() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Botijões de 13kg em:',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text('Av. Paulista, 1001'),
                Text(
                  'Paulista, São Paulo, SP',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.place,
                color: Colors.blue,
              ),
              Text(
                'Mudar',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _lista() {
    return ListView.builder(
      itemCount: this.empresas?.length ?? 0,
      itemBuilder: (_, index) {
        final empresa = Empresa.fromMap(this.empresas[index]);
        return GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => EmpresaPage(empresa))),
          child: EmpresaCardWidget(empresa),
        );
      },
    );
  }
}
