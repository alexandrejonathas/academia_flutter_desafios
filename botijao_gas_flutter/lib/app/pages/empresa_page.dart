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
    var mediaQuery = MediaQuery.of(context);

    var appBar = AppBar(
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
    );

    var height = mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height;

    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.grey[100],
      body: Container(
        width: mediaQuery.size.width,
        height: height,
        child: Column(
          children: [
            _title(),
            SizedBox(
              height: 3,
            ),
            _subTitle(),
            _detail1(),
            Expanded(
              child: SizedBox(),
            ),
            _botao(),
          ],
        ),
      ),
    );
  }

  _title() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PassosWidget(
              'Comprar',
              active: true,
            ),
            _line(),
            PassosWidget('Pagamento'),
            _line(),
            PassosWidget('Confirmação')
          ],
        ),
      ),
    );
  }

  _subTitle() {
    return Container(
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
    );
  }

  _detail1() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.home,
                size: 35,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.empresa.nome),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${this.empresa.nota}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                        ),
                        Text(
                          '${this.empresa.tempoMedio} min',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.orange,
                    child: Text('${this.empresa.tipo}'),
                  ),
                  Text(
                    'Aberto até as 17h',
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  )
                ],
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Botijão de 13kg'),
                    SizedBox(
                      height: 5,
                    ),
                    Text('${this.empresa.tipo}'),
                    SizedBox(
                      height: 5,
                    ),
                    PrecoWidget(this.empresa.preco),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        decrementarQuantidade();
                      },
                      child: BotaoWidget(Icons.remove),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 50,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset('assets/botijao.png'),
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
                      child: BotaoWidget(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _botao() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.all(20),
      child: Text(
        'IR PARA O PAGAMENTO',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.blue[300],
            Colors.blue[700],
          ],
        ),
      ),
    );
  }

  _line() {
    return Expanded(
      child: Column(
        children: [
          Divider(
            color: Colors.grey,
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
