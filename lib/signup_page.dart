import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomcontrol/control_panel.dart';
// import 'package:roomcontrol/loading_page.dart';
// import 'package:roomcontrol/control_panel.dart';
import 'package:roomcontrol/login_page.dart';
import 'package:roomcontrol/validators.dart';
import 'widgets/form_submit_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupUI extends StatefulWidget with EmailPasswordProviders{

  static String id = 'signup';

  @override
  _SignupUIState createState() => _SignupUIState();
}

class _SignupUIState extends State<SignupUI> {

  final _auth = FirebaseAuth.instance;

  final _signupScaffold = GlobalKey<ScaffoldState>();

  final TextEditingController textnamecontrol = TextEditingController();
  final TextEditingController emailcontrol = TextEditingController();
  final TextEditingController passwordcontrol = TextEditingController();

   String get _email => emailcontrol.text;
   String get _password => passwordcontrol.text;
   String get _username => textnamecontrol.text;

    bool emailValid =true;
    bool passwordValid = true;
    bool usernamevalid = true;

  bool checkboxchecked = false;
  

  _onSubmit() async {
    var dontproceed = true;

    if(_email == '' || _email == null ){
      setState(() {
        emailValid = false;
      });
      
      dontproceed =false;

    }
    if( _password == '' || _password == null ){
       setState(() {
        passwordValid = false;
      });
     dontproceed =false;
    }
    if(_username == '' || _username == null){
       setState(() {
        usernamevalid = false;
      });
       dontproceed =false;
    }
    if(checkboxchecked == false){

       dontproceed = false;
       showSnackBar('Please Accept the terms and conditions!');
    
    }
    if(dontproceed){

      try{

      final newuser = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
      //  print(newuser);

      if(newuser != null){

        //  LoadingScreen(duration: Duration(seconds:5 ),pagenavigate: ControlPanel.id,);
        Navigator.pushNamed(context, ControlPanel.id);
      }
        }catch(e){
          showSnackBar(e);
          print(e);
        }

    }

  }
  

  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: false);

    // emailValid = widget.emailValidator.isValid(_email);
    // passwordValid = widget.passwordValidator.isValid(_password);
    // usernamevalid = widget.emailValidator.isValid(_username);

    return Scaffold(
      key: _signupScaffold,
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
                              // Icon(Icons.group),
                              Image.asset('assets/images/Icon feather-user.png'),
                              // SvgPicture.asset('assets/images/user.svg'),
                                Padding(
                                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(230),
                                    child: TextField(
                                      controller: textnamecontrol,
                                       onChanged: (val){
                                          if(val != ''){
                                          setState(() {
                                            usernamevalid = true;
                                          });
                                        }
                                       },
                                      decoration: InputDecoration(
                                      hintText: 'Username',
                                      errorText: usernamevalid ? null : widget.usernameError,
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
                                // Icon(Icons.lock),
                                Image.asset('assets/images/Icon feather-lock.png'),
                                Padding(
                                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(230),
                                    child: TextField(
                                       onChanged: (val){
                                          if(val != ''){
                                          setState(() {
                                            passwordValid = true;
                                          });
                                        }
                                       },
                                      controller: passwordcontrol,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                      hintText: 'Password',
                                      errorText: passwordValid ? null : widget.passwordError,
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
                                // Icon(Icons.email),
                                Image.asset('assets/images/Icon feather-mail.png'),
                                Padding(
                                  padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                                  child: SizedBox(
                                    width: ScreenUtil().setWidth(230),
                                    child: TextField(
                                      controller: emailcontrol,
                                      onChanged: (val){
                                          if(val != ''){
                                          setState(() {
                                            emailValid = true;
                                          });
                                        }
                                       },
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                      hintText: 'Email',
                                      errorText: emailValid ? null :  widget.emailerror,
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
                                  child: Checkbox(value: checkboxchecked, onChanged: (val){
                                     setState(() {
                                       checkboxchecked = val;
                                     });
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
                            FormSubmitButton(buttonType: 'SIGN UP', onPressed: _onSubmit)
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

  void showSnackBar(text){

      final snackbar = SnackBar(
        backgroundColor: Color(0xFF00a79b),
      content: Text(
          text,
          style: TextStyle(color:Colors.white,),
        ),
      );
    _signupScaffold.currentState.showSnackBar(snackbar);

  }
}