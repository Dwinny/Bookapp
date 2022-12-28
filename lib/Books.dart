import 'package:flutter/material.dart';

class Books extends StatelessWidget {
  final Color color;
  final String name;
  Books(this.color, this.name);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: color),
      child: Text(name),
    );
  }
}
