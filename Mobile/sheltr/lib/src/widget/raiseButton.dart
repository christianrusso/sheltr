import 'package:flutter/material.dart';

class RaiseButtonCustom extends StatelessWidget {
  final Function onClick;

  RaiseButtonCustom({@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: new Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0, 3.0),
                  spreadRadius: 3.0)
            ]),
        child: Center(
          child: Icon(
            Icons.add,
            color: Colors.blue,
            size: 40.0,
          ),
        ),
      ),
    );
  }
}
