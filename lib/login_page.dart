import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomcontrol/signup_page.dart';
import 'package:simple_animations/simple_animations.dart';


class LoginPageUI extends StatefulWidget {

  static String id = 'loginpage';

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

    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: false);

    return Scaffold(
        backgroundColor: Color(0xfffffff),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.topLeft,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(380),
                width: ScreenUtil().setWidth(360),
                decoration: BoxDecoration(
                  color: Color(0xff042c38),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Mask Group 1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                // color: Color(0xff042c38),
                // child: Image.asset('assets/images/Mask Group 1.png',fit: BoxFit.fill,filterQuality: FilterQuality.high,),
              ),
              Positioned(
                // duration: Duration(seconds:5),
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
                            // SvgPicture.asset('assets/images/user.svg'),
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
                                  fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: true),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, SignupUI.id);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(10)),
                                  child: Text('SIGN UP',style: TextStyle(color:Color(0xff00a79b),
                                    fontSize: ScreenUtil().setSp(17.0,allowFontScalingSelf: true),
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
        ),
    );
  }
}