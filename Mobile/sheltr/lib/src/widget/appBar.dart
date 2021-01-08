import 'package:flutter/material.dart';

class AppBarCustom extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              IconButton(
                  icon: Icon(
                    Icons.dehaze,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
