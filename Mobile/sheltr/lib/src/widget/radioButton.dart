import 'package:flutter/material.dart';
import 'package:sheltr/src/pages/private/shared/perfil_page.dart';

class RadioButtonCustom extends StatefulWidget {
  final List<RadioModel> itmesRadios;
  final bool isRich;

  RadioButtonCustom({@required this.itmesRadios, this.isRich = false});

  @override
  _RadioButtonCustomState createState() => _RadioButtonCustomState();
}

class _RadioButtonCustomState extends State<RadioButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: widget.itmesRadios.length,
          itemBuilder: (BuildContext context, int index) {
            if (widget.isRich) {
              return InkWell(
                splashColor: Colors.blueAccent,
                onTap: () {
                  setState(() {
                    widget.itmesRadios.forEach((e) => e.isSelected = false);
                    widget.itmesRadios[index].isSelected = true;
                  });
                },
                child: RadioItemRich(widget.itmesRadios[index]),
              );
            }
            return InkWell(
              splashColor: Colors.blueAccent,
              onTap: () {
                setState(() {
                  widget.itmesRadios.forEach((e) => e.isSelected = false);
                  widget.itmesRadios[index].isSelected = true;
                });
              },
              child: RadioItem(widget.itmesRadios[index]),
            );
          }),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 5.0, bottom: 30.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: Text(_item.buttonText,
                  style: TextStyle(
                      color: _item.isSelected ? Colors.white : Colors.grey,
                      fontSize: 18.0)),
            ),
            decoration: BoxDecoration(
                gradient: _item.isSelected
                    ? LinearGradient(
                        colors: [Color(0xFF176CF2), Color(0xFF59C0EE)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : LinearGradient(
                        colors: [Colors.white, Colors.white],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                border: Border.all(
                    width: 1.0,
                    color: _item.isSelected ? Colors.blueAccent : Colors.grey),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(50.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
          ),
        ],
      ),
    );
  }
}

class RadioItemRich extends StatelessWidget {
  final RadioModel _item;
  RadioItemRich(this._item);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: 65.0,
            width: MediaQuery.of(context).size.width * 0.85,
            child: ListTile(
              dense: true,
              leading: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 3,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                      ),
                    ]),
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundImage: NetworkImage(_item.pathImagen),
                ),
              ),
              title: Text(
                _item.textName,
                style: TextStyle(
                    fontSize: 19.0,
                    fontWeight: FontWeight.bold,
                    color: _item.isSelected ? Colors.white : Colors.black54),
              ),
              subtitle: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(PerfilPage.routeName);
                },
                child: Text('+ Info',
                    style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        color: _item.isSelected
                            ? Colors.white
                            : Colors.blueAccent)),
              ),
              trailing: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    color: _item.isSelected ? Colors.white : Colors.blueAccent,
                    size: 15.0,
                  ),
                  SizedBox(width: 15.0),
                  Text(_item.finalDecription,
                      style: TextStyle(
                          color: _item.isSelected
                              ? Colors.white
                              : Colors.blueAccent,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            decoration: BoxDecoration(
                gradient: _item.isSelected
                    ? LinearGradient(
                        colors: [Color(0xFF176CF2), Color(0xFF59C0EE)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      )
                    : LinearGradient(
                        colors: [Colors.white, Colors.white],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                border: Border.all(
                    width: 1.0,
                    color: _item.isSelected ? Colors.blueAccent : Colors.grey),
                borderRadius:
                    const BorderRadius.all(const Radius.circular(50.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3.0,
                      offset: Offset(0.0, 5.0),
                      spreadRadius: 3.0)
                ]),
          ),
        ],
      ),
    );
  }
}

class RadioModel {
  bool isSelected;
  final String buttonText;
  final String text;
  final String textName;
  final String finalDecription;
  final String pathImagen;
  final String id;

  RadioModel(
      {this.isSelected,
      this.buttonText,
      this.text = '',
      this.textName = '',
      this.finalDecription = '',
      this.pathImagen = '',
      @required this.id});
}
