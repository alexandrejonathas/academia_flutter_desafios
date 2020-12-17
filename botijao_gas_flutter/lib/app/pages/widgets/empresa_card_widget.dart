import 'package:botijao_gas_flutter/app/models/empresa.dart';
import 'package:botijao_gas_flutter/app/pages/widgets/melhor_preco_widget.dart';
import 'package:botijao_gas_flutter/app/utils/number_util.dart';
import 'package:flutter/material.dart';

class EmpresaCardWidget extends StatelessWidget {
  final Empresa empresa;

  const EmpresaCardWidget(this.empresa);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          RotatedBox(
            child: Container(
              width: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(int.tryParse('0xFF${this.empresa.cor}')),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
              ),
              child: Text(
                this.empresa.tipo,
                style: TextStyle(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            quarterTurns: -1,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 10, bottom: 6),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(6),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(this.empresa.nome),
                        empresa.melhorPreco ? MelhorPrecoWidget() : Container()
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nota',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${this.empresa.nota}',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                )
                              ],
                            )
                          ],
                        ), //Fim nota
                        Column(
                          children: [
                            Text(
                              'Tempo médio',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${this.empresa.tempoMedio}',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  TextSpan(
                                    text: ' min',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ), //Fim tempo médio
                        Column(
                          children: [
                            Text(
                              'Preço',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 13,
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  'R\$ ${NumberUtil.toReal(this.empresa.preco)}',
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ), //Fim preço
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
