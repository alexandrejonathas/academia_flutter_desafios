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
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    color: active ? Colors.grey[300] : Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                child: Container(
                  decoration: BoxDecoration(
                    color: active ? Colors.blue : Colors.transparent,
                    borderRadius: BorderRadius.circular(50),
                    border: active
                        ? Border.all(color: Colors.blue)
                        : Border.all(color: Colors.grey[500]),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  this.passo,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
