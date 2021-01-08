import 'package:flutter/material.dart';

class ImagenHorizontal extends StatefulWidget {
  final List<String> imagenes;
  final VoidCallback onPress;

  ImagenHorizontal({@required this.imagenes, @required this.onPress});

  @override
  _ImagenHorizontalState createState() => _ImagenHorizontalState();
}

class _ImagenHorizontalState extends State<ImagenHorizontal> {
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;

    return Container(
      height: _screen.height * 0.25,
      child: ListView.builder(
        controller: _controller,
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        reverse: true,
        shrinkWrap: true,
        itemCount: widget.imagenes.length,
        itemBuilder: (BuildContext context, int index) {
          return _tarjeta(context, widget.imagenes[index]);
        },
      ),
    );
  }

  Widget _tarjeta(BuildContext context, String imagen) {
    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: imagen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(imagen),
                placeholder: AssetImage('assets/images/no-image.jpg'),
                fit: BoxFit.cover,
                height: 160.0,
              ),
            ),
          ),
          // SizedBox(height: 5.0),
          // Text(pelicula.title,
          // overflow: TextOverflow.ellipsis,
          // style: Theme.of(context).textTheme.caption,
          // )
        ],
      ),
    );

    return GestureDetector(child: tarjeta, onTap: this.widget.onPress);
  }
}
