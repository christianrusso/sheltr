import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheltr/src/pages/private/project/steps_page.dart';
import 'package:sheltr/src/services/projectservice.dart';
import 'package:sheltr/src/widget/container.dart';
import 'package:sheltr/src/widget/sideMenu.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AddProjectPage extends StatefulWidget {
  static final String routeName = 'addproject';
  @override
  _AddProjectPageState createState() => _AddProjectPageState();
}

class _AddProjectPageState extends State<AddProjectPage> {
  final int _numPages = 6;
  final PageController _pageController = PageController(initialPage: 0);
  List<String> _imageStep;
  int _currentPage = 0;
  List _forms;

  @override
  void initState() {
    _imageStep = [
      'assets/images/icon_rule.png',
      'assets/images/icon_paint.png',
      'assets/images/icon_rule.png',
      'assets/images/icon_building.png',
      'assets/images/icon_money.png',
      'assets/images/icon_paint.png',
      'assets/images/icon_paint.png',
    ];
    _forms = [
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: OneStep(() {
          _nextFormStep();
        }),
      ),
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: TwoStep(() {
          _nextFormStep();
        }),
      ),
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: ThreeStep(() {
          _nextFormStep();
        }),
      ),
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: FourStep(() {
          _nextFormStep();
        }),
      ),
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: FiveStep(() {
          _nextFormStep();
        }),
      ),
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: SixStep(() {
          _nextFormStep();
        }),
      ),
      WillPopScope(
        onWillPop: () => Future.sync(this.onWillPop),
        child: SevenStep(() {
          Navigator.pop(context);
        }),
      ),
      WillPopScope(
          onWillPop: () => Future.sync(this.onWillPop), child: Container()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final project = Provider.of<ProjectService>(context);

    print(project.project);

    return Scaffold(
      endDrawer: MenuCustom(),
      appBar: AppBar(
        title: Container(),
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[ContainerCustom(), _head(), _body()],
      ),
    );
  }

  Widget _head() {
    return Stack(
      children: <Widget>[
        Positioned(
          left: 30.0,
          top: 40.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Nuevo Proyecto...',
                  style: TextStyle(fontSize: 25.0, color: Colors.black38)),
              SizedBox(height: 10.0),
              Text('Paso ${_currentPage + 1}',
                  style: TextStyle(fontSize: 25.0, color: Colors.blue)),
            ],
          ),
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.19,
            left: 30.0,
            child: Container(
              height: 20.0,
              width: MediaQuery.of(context).size.width * 0.80,
              child: StepProgressIndicator(
                totalSteps: _numPages,
                currentStep: _currentPage,
                size: 10,
                padding: 0,
                selectedColor: Colors.white,
                unselectedColor: Colors.cyan,
                roundedEdges: Radius.circular(10),
                selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.blue[100], Colors.blue],
                ),
                unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.grey, Colors.grey[200]],
                ),
              ),
            )),
        Positioned(
            top: 24.0,
            right: 30.0,
            child: Container(
              height: 100.0,
              width: 100.0,
              child: Image(image: AssetImage(_imageStep[_currentPage])),
            )),
      ],
    );
  }

  Widget _body() {
    return Container(
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.23, left: 30.0),
        height: double.infinity,
        child: PageView.builder(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _forms[index];
          },
          onPageChanged: (int page) {
            setState(() {
              _currentPage = page;
            });
          },
        ));
  }

  bool onWillPop() {
    if (_pageController.page.round() == _pageController.initialPage)
      return true;

    _pageController.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );

    return false;
  }

  void _nextFormStep() {
    _pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
