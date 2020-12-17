import 'package:flutter/material.dart';

class BotaoWidget extends StatelessWidget {
  final IconData icon;
  final Color cor;
  const BotaoWidget(this.icon, {this.cor = Colors.grey});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      child: Center(
        child: Icon(icon),
      ),
      decoration: BoxDecoration(
        color: this.cor,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
