import 'package:dribbble_clone/model/drawer_item.dart';
import 'package:dribbble_clone/view/screen1/screen1_view.dart';
import 'package:dribbble_clone/view/screen2/screen2_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'home_view';

  @override
  State<StatefulWidget> createState() {
    return HomeViewState();
  }
}

class HomeViewState extends State<HomeView> {
  final drawerItems = [
    DrawerItem('Screen 1', Icons.rss_feed),
    DrawerItem('Screen 2', Icons.local_pizza),
  ];
  int _selectedDrawerIndex = 0;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  _getDrawerItemWidget(int index) {
    if (index == 0) return Screen1View();
    else if (index == 1) return Screen2View();
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];

    for (var i = 0; i < drawerItems.length; i++) {
      var d = drawerItems[i];
      drawerOptions.add(
        ListTile(
          leading: Icon(d.icon),
          title: Text(d.title),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectItem(i),
        )
      );
    }

    // Use below code for standart navigation drawer //
    /*return Scaffold(
      appBar: AppBar(
        title: Text(drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text('johndoe@gmail.com')
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );*/

    // Use below code if u want to achieve custom ui drawer //
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _drawerKey.currentState.openDrawer() // this code is to use for open the drawer
        ),
        title: Text(drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text('johndoe@gmail.com')
            ),
            Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}