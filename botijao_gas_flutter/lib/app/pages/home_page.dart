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
          IconButton(
            onPressed: () => print('Clicou no botão sync'),
            icon: Icon(
              Icons.sync_sharp,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () => print('Clicou no botão ajuda'),
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return _body(constraints);
        },
      ),
    );
  }

  Widget _body(constraints) {
    return Column(
      children: [
        _topo(constraints),
        Expanded(
          child: _lista(),
        ),
      ],
    );
  }

  Widget _topo(BoxConstraints constraints) {
    var height = constraints.maxHeight * 0.15;
    return Container(
      padding: EdgeInsets.all(10),
      width: constraints.maxWidth,
      height: height,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
