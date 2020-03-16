import 'package:dribbble_clone/view/screen1/screen1_view.dart';
import 'package:dribbble_clone/view/screen2/screen2_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/helper/constant.dart';
import '../../core/theme/theme_color.dart';
import '../../core/theme/theme_text_style.dart';

class HomeView extends StatefulWidget {

  static const routeName = 'container-home-view';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var selectedIndex = 0;
  List<Widget> _listScreen = [Screen1View(), Screen2View()];

  onItemTapped(int index) async {
    if (index == 3) {
      final sharedPref = await SharedPreferences.getInstance();
      final isLogin = sharedPref.getBool(Constant.IS_LOGIN) ?? false;
      if (!isLogin) {
        //Navigator.of(context).pushNamed(LoginView.routeName);
      }
    } else {
      setState(() => selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _listScreen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 20,
              color: selectedIndex == 0 ? ThemeColor.orange : ThemeColor.dark_grey,
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Screen 1',
                style: ThemeTextStyle.ubuntuR.apply(
                  fontSizeDelta: -6, color: selectedIndex == 0 ? ThemeColor.orange : ThemeColor.dark_grey,
                ),
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 20,
              color: selectedIndex == 1 ? ThemeColor.orange : ThemeColor.dark_grey,
            ),
            title: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Text(
                'Screen 2',
                style: ThemeTextStyle.ubuntuR.apply(
                  fontSizeDelta: -6, color: selectedIndex == 1 ? ThemeColor.orange : ThemeColor.dark_grey,
                ),
              ),
            ),
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: ThemeColor.orange,
        onTap: onItemTapped,
      ),
    );
  }
}
