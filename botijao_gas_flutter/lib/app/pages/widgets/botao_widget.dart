import 'package:flutter/material.dart';

class BotaoWidget extends StatelessWidget {
  final String sinal;
  final Color cor;
  const BotaoWidget(this.sinal, {this.cor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Center(
        child: Text(
          this.sinal,
          style: TextStyle(fontSize: 22),
        ),
      ),
      decoration: BoxDecoration(
        color: this.cor,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
