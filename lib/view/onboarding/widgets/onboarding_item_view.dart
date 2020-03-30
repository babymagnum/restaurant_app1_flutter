import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:dribbble_clone/model/onboarding_model.dart';
import 'package:dribbble_clone/view/login/login_view.dart';
import 'package:flutter/material.dart';

class OnboardingItemView extends StatelessWidget {

  OnboardingItemView({Key key, this.item}): super(key: key);

  final OnboardingModel item;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(item.image, width: size.width * 0.7, height: size.width * 0.7,),
              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(item.title, textAlign: TextAlign.center, style: ThemeTextStyle.poppinsSemiBold.apply(color: Colors.black, fontSizeDelta: 8),),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(item.description, textAlign: TextAlign.center, style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF838389)),),
              )
            ],
          )
        ),
        Parent(
          gesture: Gestures()..onTap(() => Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginView()))),
          style: ParentStyle()..ripple(true, splashColor: Colors.white.withAlpha(50))..background.color(Color(0xFFFFBD2F))..borderRadius(all: 6)..boxShadow(color: Color(0xFFFFBD2F).withOpacity(0.2), offset: Offset(1, 6), blur: 3)
            ..padding(vertical: 12)..margin(horizontal: 16),
          child: Center(
            child: Text('LOGIN', style: ThemeTextStyle.poppinsSemiBold.apply(color: Color(0xFF593F08), fontSizeDelta: -2),),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
