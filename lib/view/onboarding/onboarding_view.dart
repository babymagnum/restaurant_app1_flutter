import 'package:dribbble_clone/core/helper/page_indicator.dart';
import 'package:dribbble_clone/model/onboarding_model.dart';
import 'package:dribbble_clone/view/onboarding/widgets/onboarding_item_view.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {

  static const routeName = 'onboarding_view';

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {

  List<OnboardingModel> _listOnboardingData = [
    OnboardingModel('Set your location to start exploring restaurants around you', 'Quick Search', 'assets/images/image_onboarding_1.png'),
    OnboardingModel('Set your location to start exploring restaurants around you', 'Variety of Food', 'assets/images/image_onboarding_2.png'),
    OnboardingModel('Set your location to start exploring restaurants around you', 'Search for Place', 'assets/images/image_onboarding_3.png'),
    OnboardingModel('Set your location to start exploring restaurants around you', 'Fast Delivery', 'assets/images/image_onboarding_4.png'),
  ];
  int _selectedPage = 0;

  List<Widget> _listOnboardingView() {
    List<Widget> list = List();
    _listOnboardingData.forEach((item) {
      list.add(OnboardingItemView(item: item));
    });

    return list;
  }

  List<Widget> _pageIndicators() {
    List<Widget> listWidget = List();

    for(int i=0; i<_listOnboardingData.length; i++) {
      listWidget.add(PageIndicator(
        isSelected: _selectedPage == i,
        color: _selectedPage == i ? Color(0xFFFFBD2F) : Color(0xFFFFBD2F).withOpacity(0.3),
        isFirst: i == 0,
        isLast: i == _listOnboardingData.length -1,
      ));
    }

    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0, right: 0, top: 0, bottom: 72,
            child: PageView(
              onPageChanged: (index) => setState(() => _selectedPage = index),
              children: _listOnboardingView(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 44),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _pageIndicators(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
