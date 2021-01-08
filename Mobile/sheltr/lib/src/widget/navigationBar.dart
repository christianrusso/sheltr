import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bottonBarClipper.dart';

class NavigationBarCustom extends StatefulWidget {
  final Color barColor;
  final Color iconBarColor;
  final Color circleBarColor;
  final Color shadowColor;
  final List<NavigationItem> icons;
  final double height;

  NavigationBarCustom(
      {this.barColor = Colors.white,
      this.iconBarColor = Colors.black87,
      this.circleBarColor = Colors.grey,
      this.shadowColor = Colors.black26,
      @required this.icons,
      this.height = 70});

  @override
  _NavigationBarCustomState createState() => _NavigationBarCustomState();
}

class _NavigationBarCustomState extends State<NavigationBarCustom>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  List<bool> selected = [];
  double _value;
  double _newposition;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    final Animation curve =
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut);
    _animation = Tween<double>(end: -33, begin: 0).animate(curve);

    _controller.forward();

    selected = List.generate(widget.icons.length, (index) {
      if (index == 0)
        return true;
      else
        return false;
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _value = MediaQuery.of(context).size.width / widget.icons.length / 2;
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(NavigationBarCustom oldWidget) {
    if (oldWidget.icons != widget.icons) {
      selected = List.generate(widget.icons.length, (index) {
        if (index == 0)
          return true;
        else
          return false;
      });
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        ClipPath(
          clipper: BottomBarClipper(
              _newposition ?? (size.width / widget.icons.length) / 2),
          child: Container(
            height: widget.height,
            decoration: BoxDecoration(
                color: widget.barColor,
                border: Border.all(
                  color: Colors.black12,
                  width: 6, //
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: widget.shadowColor,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          child: CustomPaint(
            painter: CirclePaint(widget.circleBarColor),
            child: Container(
              height: 70,
              width: 70,
            ),
          ),
          builder: (BuildContext context, Widget child) {
            return Positioned(
              child: child,
              top: _animation.value,
              bottom: 0,
              left: _newposition ?? _value,
            );
          },
        ),
        ...widget.icons
            .asMap()
            .map((index, _barIcon) {
              return MapEntry(
                  index,
                  AnimatedPositioned(
                    duration: Duration(microseconds: 1500),
                    curve: Curves.elasticOut,
                    top: selected[index] ? -30 : 25,
                    left: _value * (index + 1) + 30 * index,
                    width: 60,
                    child: Column(
                      children: <Widget>[
                        IconButton(
                            icon: _barIcon.icon,
                            onPressed: () {
                              setState(() {
                                if (!selected[index]) {
                                  _controller.reset();
                                  _controller.forward();
                                  selected = selected
                                      .asMap()
                                      .map((i, v) {
                                        if (i == index)
                                          return MapEntry(i, true);
                                        else
                                          return MapEntry(i, false);
                                      })
                                      .values
                                      .toList();
                                }
                                _newposition =
                                    _value * (index + 1) + 30 * index;
                              });
                              _barIcon.onPressed();
                            }),
                        SizedBox(
                          height: 27,
                        ),
                        AnimatedSwitcher(
                            duration: Duration(milliseconds: 100),
                            child: selected[index]
                                ? Text(
                                    _barIcon.label,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: widget.iconBarColor),
                                  )
                                : Container(
                                    height: 0,
                                    width: 0,
                                  ))
                      ],
                    ),
                  ));
            })
            .values
            .toList()
      ],
    );
  }
}

class NavigationItem {
  final Widget icon;
  final Function onPressed;
  final String label;
  NavigationItem({this.icon, this.label, this.onPressed});
}

class CirclePaint extends CustomPainter {
  final Color color;
  CirclePaint(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = this.color;
    Path path = new Path();
    path.addOval(Rect.fromLTRB(0.0, 0.0, size.width - 10, size.width - 10));
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
