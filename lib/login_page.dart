import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPageUI extends StatefulWidget {
  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {

  // ScreenUtil screenutil;
  @override
  void initState() {
    // screenutil = ScreenUtil();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: true);

    return Scaffold(
        backgroundColor: Color(0xfffffff),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topLeft,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(400),
              width: ScreenUtil().setWidth(360),
              decoration: BoxDecoration(
                color: Color(0xff042c38),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/Mask Group 1.png',
                  ),
                  // fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: ScreenUtil().setWidth(0.0),
              child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom:ScreenUtil().setWidth(20.0),left:ScreenUtil().setWidth(20.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Divider(color: Colors.white,thickness: 10.0,height: 10.0,),
                      Text('Welcome',
                      style: TextStyle(color:Colors.white,
                        fontSize: ScreenUtil().setSp(20.0),
                        letterSpacing: ScreenUtil().setWidth(3.0),
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:ScreenUtil().setWidth(10.0),bottom:ScreenUtil().setWidth(10.0)),
                        child: Text('to Room Control',style: TextStyle(color:Colors.white,
                          fontSize: ScreenUtil().setSp(20.0),
                          letterSpacing: ScreenUtil().setWidth(3.0),
                          fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().setWidth(360),
                  height: ScreenUtil().setWidth(360),
                  decoration: BoxDecoration(
                    color: Color(0xffffffff),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft:Radius.circular(ScreenUtil().setWidth(30.0)),
                       topRight: Radius.circular(ScreenUtil().setWidth(30.0)),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left:ScreenUtil().setWidth(30.0),right:ScreenUtil().setWidth(30.0),top:ScreenUtil().setWidth(20.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                          Icon(Icons.group),
                            Padding(
                              padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                              child: SizedBox(
                                width: ScreenUtil().setWidth(230),
                                child: TextField(
                                  decoration: InputDecoration(
                                  hintText: 'Username',
                                    hintStyle: TextStyle(
                                      color: Colors.black45,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.lock),
                            Padding(
                              padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                              child: SizedBox(
                                width: ScreenUtil().setWidth(230),
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
                            ),
                            
                          ],
                        ),
                        Container(
                          height: ScreenUtil().setHeight(60.0),
                          width: ScreenUtil().setWidth(300),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xff00a79b),
                            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(5.0))),
                          ),
                            child: Material(
                              color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.grey,
                              child: Center(child: Text('SIGN IN',style: TextStyle(
                                color:Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(24.0),
                                letterSpacing: ScreenUtil().setWidth(3.0),
                                  ),
                                ),
                          ),
                            ),
                            ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('Dont have an account?',
                            style: TextStyle(color:Color(0xffa6a6a6),
                                fontSize: ScreenUtil().setSp(18.0),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){},
                              child: Padding(
                                padding: EdgeInsets.only(left:ScreenUtil().setWidth(10.0)),
                                child: Text('SIGN UP',style: TextStyle(color:Color(0xff00a79b),
                                    fontSize: ScreenUtil().setSp(20.0),
                                    fontWeight: FontWeight.bold,
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
              ],
            ),
            ),
          ],
      ),
        ),
    );
  }
}