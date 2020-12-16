import 'dart:ui';

import 'package:botijao_gas_flutter/app/models/empresa.dart';
import 'package:botijao_gas_flutter/app/pages/widgets/botao_widget.dart';
import 'package:botijao_gas_flutter/app/pages/widgets/passos_widget.dart';
import 'package:botijao_gas_flutter/app/pages/widgets/preco_widget.dart';
import 'package:flutter/material.dart';

class EmpresaPage extends StatefulWidget {
  final Empresa empresa;

  EmpresaPage(this.empresa);

  @override
  _EmpresaPageState createState() => _EmpresaPageState();
}

class _EmpresaPageState extends State<EmpresaPage> {
  get empresa => widget.empresa;

  int quantidade = 0;
  double total = 0;

  @override
  void initState() {
    super.initState();
    this.incrementarQuantidade();
  }

  incrementarQuantidade() {
    setState(() {
      quantidade++;
      this.total = this.quantidade * this.empresa.preco;
    });
  }

  decrementarQuantidade() {
    setState(() {
      quantidade--;
      this.total = this.quantidade * this.empresa.preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selecionar produtos'),
        actions: [
          IconButton(
            onPressed: () => print('Clicou no botão ajuda'),
            icon: Icon(
              Icons.help,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PassosWidget(
                    'Comprar',
                    active: true,
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  PassosWidget('Pagamento'),
                  Expanded(
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  PassosWidget('Confirmação')
                ],
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(2),
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Center(
                        child: Text(
                          '$quantidade',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        '${this.empresa.nome} - Botijão de 13kg',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: PrecoWidget(this.total),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(this.empresa.nome),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text('${this.empresa.nota}'),
                                          Icon(
                                            Icons.star,
                                            size: 12,
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 30),
                                            child: Text(
                                              '${this.empresa.tempoMedio} min',
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          this.empresa.tipo,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        decoration: BoxDecoration(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Botijão de gás 13kg',
                            style: TextStyle(fontSize: 11),
                          ),
                          Text(this.empresa.nome),
                          PrecoWidget(this.empresa.preco)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              decrementarQuantidade();
                            },
                            child: BotaoWidget('-'),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            height: 50,
                            child: Stack(
                              alignment: AlignmentDirectional.center,
                              children: [
                                Image.asset('assets/bojao.png'),
                                Container(
                                  margin: EdgeInsets.only(top: 8),
                                  width: 15,
                                  height: 25,
                                  child: Center(
                                    child: Text('$quantidade'),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.orange[700],
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              incrementarQuantidade();
                            },
                            child: BotaoWidget('+'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'IR PARA O PAGAMENTO',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue[200],
                        Colors.blue,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
