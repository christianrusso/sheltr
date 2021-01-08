import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  static final String routeName = 'news';

  @override
  _NewsPage createState() => _NewsPage();
}

class _NewsPage extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return _content(context);
  }

  Widget _content(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0, left: 15.0),
      width: MediaQuery.of(context).size.width * 0.93,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Noticias Sheltr',
              style: TextStyle(fontSize: 23.0, color: Colors.grey[600]),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/card1.png'),
                      fit: BoxFit.contain),
                ),
                child: Card(
                  color: Colors.white70,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 20.0),
                    child: GestureDetector(
                      onTap: () => _shownews(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Obras despues del Covid',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 15.0,
                              ),
                              Text('Palermo, Buenos Aires')
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '+Info',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/card2.png'),
                      fit: BoxFit.contain),
                ),
                child: Card(
                  color: Colors.white70,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 20.0),
                    child: GestureDetector(
                      onTap: () => _shownews(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Mejores espacios Sheltr 2020...',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 15.0,
                              ),
                              Text('Buenos Aires, Argentina')
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '+Info',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/card1.png'),
                      fit: BoxFit.contain),
                ),
                child: Card(
                  color: Colors.white70,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, top: 20.0),
                    child: GestureDetector(
                      onTap: () => _shownews(context),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Areco continua su reforma',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 15.0,
                              ),
                              Text('Buenos Aires, Argentina')
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '+Info',
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(5),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }

  void _shownews(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.fromLTRB(
                10.0, MediaQuery.of(context).size.height * 0.09, 10.0, 0.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(children: <Widget>[
                    Text(
                      'Obras despues del Covid',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Palermo, Buenos Aires')
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.watch_later,
                        size: 15,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Lunes 20.06.20')
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: 250.0,
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetuer kkkkk adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis  nnn nostrud exerci tation ullamcorper suscipit lobortis nisl ut a....'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '+Info',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                  )
                ],
              ),
            ),
          );
        });
  }
}
