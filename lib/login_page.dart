import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageUI extends StatefulWidget {
  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {

  ScreenUtil screenutil = ScreenUtil();

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: true);

    return Scaffold(
        backgroundColor: Color(0xfffffff),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: 400,
              width: 360,
              decoration: BoxDecoration(
                color: Color(0xff042c38),
                image: DecorationImage(
                  image: AssetImage(
                    'images/Mask Group 1.png',
                  ),
                  // fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              child: 
            Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft:Radius.circular(30.0),
                   topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left:30.0,right:30.0,top:50.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                      Icon(Icons.group),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            decoration: InputDecoration(
                            hintText: 'Username',
                              hintStyle: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(Icons.lock),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                            hintText: 'Password',
                              hintStyle: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ),
          ],
      ),
        ),
    );
  }
}