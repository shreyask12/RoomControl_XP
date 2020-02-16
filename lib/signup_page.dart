import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomcontrol/control_panel.dart';
import 'package:roomcontrol/login_page.dart';

class SignupUI extends StatefulWidget {

  static String id = 'signup';

  @override
  _SignupUIState createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {
  
  

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: false);

    return Scaffold(
      backgroundColor: Color(0xffffff),
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().setHeight(720),
          width: ScreenUtil().setWidth(360),
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(250),
                width: ScreenUtil().setWidth(360),
                decoration: BoxDecoration(
                  color: Color(0xff042c38),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Mask Group -1.png',
                    ),
                    fit: BoxFit.fill,
                  ), 
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children:<Widget>[ 
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setWidth(40),left: ScreenUtil().setWidth(20)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              Navigator.pushNamed(context, LoginPageUI.id);
                            },
                            child: Image.asset('assets/images/Group 62.png')),
                          Padding(
                            padding: EdgeInsets.only(left:ScreenUtil().setWidth(12)),
                              child: Text('Back',style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ), 
                        ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left:ScreenUtil().setWidth(20),bottom: ScreenUtil().setWidth(55)),
                          child: Text('Create New Account',style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(18),
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              Positioned(
                // top: ScreenUtil().setWidth(),
                  bottom: ScreenUtil().setWidth(0.0),
                  child: 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(360),
                      height: ScreenUtil().setWidth(500),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Icon(Icons.email),
                                Padding(
                                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(230),
                                    child: TextField(
                                      obscureText: true,
                                      decoration: InputDecoration(
                                      hintText: 'Email',
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Expanded(
                                  child: Checkbox(value: false, onChanged: (val){
                                     
                                  },activeColor: Color(0xffa6a6a6),checkColor: Color(0xff00a79b),),
                                ),
                                Expanded(
                                  flex:5,
                                child: Text('I have accepted the ',
                                  style: TextStyle(color:Color(0xffa6a6a6),
                                      fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: true),
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                  Expanded(
                                    flex:5,
                                    child: Container(
                                   //  width: ScreenUtil().setWidth(100),
                                     padding: EdgeInsets.only(
                                       bottom: ScreenUtil().setWidth(3), // space between underline and text
                                     ),
                                     decoration: BoxDecoration(
                                       border: Border(bottom: BorderSide(
                                         color: Color(0xff00a79b),  // Text colour here
                                         width: ScreenUtil().setWidth(1), // Underline width
                                       ),
                                       )
                                     ),
                                     child: Text(
                                       "Terms & Condition",
                                       style: TextStyle(
                                         color: Color(0xff00a79b),
                                         fontWeight: FontWeight.w600,
                                          // Text colour here
                                       ),
                                     ),
                                   ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushNamed(context,ControlPanel.id);
                              },
                              child: Container(
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
                                    child: Center(
                                      child: Text('SIGN UP',style: TextStyle(
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