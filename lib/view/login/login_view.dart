import 'package:division/division.dart';
import 'package:dribbble_clone/core/theme/theme_text_style.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {

  FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0, right: 0, top: 0, bottom: 72,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: MediaQuery.of(context).padding.top + 12,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Parent(
                          style: ParentStyle()..ripple(true)..margin(right: 8)..padding(horizontal: 8, vertical: 8)..borderRadius(all: 6),
                          child: Text('SIGN UP', style: ThemeTextStyle.poppinsSemiBold.apply(color: Color(0xFF838389), fontSizeDelta: -2),),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text('Log In', style: ThemeTextStyle.poppinsSemiBold.apply(color: Colors.black, fontSizeDelta: 8),),
                      SizedBox(height: 69,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF838389)),
                          onEditingComplete: () => FocusScope.of(context).requestFocus(_passwordFocus),
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF838389)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFBD2F), width: 1),),
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFCDCDD0), width: 1),),
                          ),
                        ),
                      ),
                      SizedBox(height: 35,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          obscureText: true,
                          focusNode: _passwordFocus,
                          style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF838389)),
                          onEditingComplete: () => FocusScope.of(context).requestFocus(FocusNode()),
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF838389)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFFFBD2F), width: 1),),
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFFCDCDD0), width: 1),),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Align(
                        alignment: Alignment.topRight,
                        child: Parent(
                          gesture: Gestures()..onTap(() {}),
                          style: ParentStyle()..ripple(true)..margin(right: 8)..padding(horizontal: 8, vertical: 8)..borderRadius(all: 6),
                          child: Text('Forgot password?', style: ThemeTextStyle.poppinsMedium.apply(color: Color(0xFF838389)),),
                        ),
                      )
                    ],
                  )
                ),
                Parent(
                  gesture: Gestures()..onTap(() {}),
                  style: ParentStyle()..ripple(true, splashColor: Colors.white.withAlpha(50))..background.color(Color(0xFFFFBD2F))..borderRadius(all: 6)..boxShadow(color: Color(0xFFFFBD2F).withOpacity(0.2), offset: Offset(1, 6), blur: 3)
                    ..padding(vertical: 12)..margin(horizontal: 16),
                  child: Center(
                    child: Text('LOGIN', style: ThemeTextStyle.poppinsSemiBold.apply(color: Color(0xFF593F08), fontSizeDelta: -2),),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
