import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<String> imagenUrls;
  final VoidCallback onPress;

  CardSwiper({@required this.imagenUrls, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    final _screen = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screen.width * 0.5,
        itemHeight: _screen.height * 0.3,
        itemBuilder: (BuildContext context, int index) {
          return Hero(
            tag: imagenUrls[index],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: GestureDetector(
                onTap: onPress,
                child: FadeInImage(
                  image: NetworkImage(imagenUrls[index]),
                  placeholder: AssetImage('assets/images/no-image.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: imagenUrls.length,
        layout: SwiperLayout.STACK,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
