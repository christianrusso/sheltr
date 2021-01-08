import 'package:flutter/material.dart';

class ContainerCustom extends StatefulWidget {
  final Color backColor;
  final Color shadowColor;
  final double size;

  ContainerCustom(
      {this.backColor = Colors.white,
      this.shadowColor = Colors.black26,
      this.size});

  @override
  _ContainerCustomState createState() => _ContainerCustomState();
}

class _ContainerCustomState extends State<ContainerCustom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(
                0.0,
                (widget.size == 0 || widget.size == null)
                    ? MediaQuery.of(context).size.height * 0.03
                    : widget.size,
                0.0,
                0.0),
            decoration: BoxDecoration(
                color: widget.backColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: widget.shadowColor,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
          ),
        )
      ],
    );
  }
}
