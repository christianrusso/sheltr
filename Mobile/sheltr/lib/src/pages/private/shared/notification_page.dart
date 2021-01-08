import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  static final String routeName = 'notifications';

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return _content();
  }

  Widget _content() {
    return Positioned(
        top: 35.0,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Notificaciones',
                  style: TextStyle(color: Colors.grey[600], fontSize: 25.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Esta Semana',
                  style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing.'),
                    ),
                    Icon(
                      Icons.brightness_1,
                      size: 8.0,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing.'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing.'),
                    ),
                    Icon(
                      Icons.brightness_1,
                      size: 8.0,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing.'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'Anteriores',
                  style: TextStyle(color: Colors.grey[600], fontSize: 20.0),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.calendar_today),
                    SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Text(
                          'Lorem Ipsum is simply dummy text of the printing.'),
                    ),
                    Icon(
                      Icons.brightness_1,
                      size: 8.0,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
