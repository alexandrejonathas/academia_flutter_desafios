import 'package:botijao_gas_flutter/app/utils/number_util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrecoWidget extends StatelessWidget {
  final double preco;

  const PrecoWidget(this.preco);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'R\$',
          style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          '${NumberUtil.toReal(this.preco)}',
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
