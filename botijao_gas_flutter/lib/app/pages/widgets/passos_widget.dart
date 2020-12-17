import 'package:flutter/material.dart';

class PassosWidget extends StatefulWidget {
  final String passo;
  final bool active;

  PassosWidget(this.passo, {this.active = false});

  @override
  _PassosWidgetState createState() => _PassosWidgetState();
}

class _PassosWidgetState extends State<PassosWidget> {
  String get passo => widget.passo;
  bool get active => widget.active;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 15),
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: active ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(100),
            border: !active ? Border.all(color: Colors.grey) : null,
            boxShadow: active
                ? [
                    BoxShadow(
                      blurRadius: 1,
                      spreadRadius: 10,
                      color: Colors.grey[300],
                    )
                  ]
                : null,
          ),
        ),
        Text(
          this.passo,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
