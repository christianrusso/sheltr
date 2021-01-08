import 'dart:ui';

import 'package:flutter/material.dart';

class AwesomeListItem extends StatefulWidget {
  final String id;
  final String title;
  final String content;
  final Color color;
  final String image;
  final VoidCallback onPressed;

  AwesomeListItem(
      {this.id,
      this.title,
      this.content,
      this.color,
      this.image,
      @required this.onPressed});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  String get id => widget.id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: new Row(
        children: <Widget>[
          new Container(width: 10.0, height: 190.0, color: widget.color),
          new Expanded(
            child: new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: new Text(
                      widget.content,
                      style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Container(
            height: 150.0,
            width: 150.0,
            color: Colors.white,
            child: Stack(
              children: <Widget>[
                new Transform.translate(
                  offset: new Offset(50.0, 0.0),
                  child: new Container(
                    height: 100.0,
                    width: 100.0,
                    color: widget.color,
                  ),
                ),
                new Transform.translate(
                  offset: Offset(10.0, 20.0),
                  child: new Card(
                    elevation: 20.0,
                    child: new Container(
                      height: 120.0,
                      width: 120.0,
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              width: 10.0,
                              color: Colors.white,
                              style: BorderStyle.solid),
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
