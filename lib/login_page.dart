import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomcontrol/control_panel.dart';
// import 'package:roomcontrol/loading_page.dart';
// import 'package:roomcontrol/main.dart';
import 'package:roomcontrol/signup_page.dart';
import 'widgets/form_submit_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'validators.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';



class LoginPageUI extends StatefulWidget with EmailPasswordProviders{

  static String id = 'loginpage';

  @override
  _LoginPageUIState createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {

  final _auth = FirebaseAuth.instance;

  final _loginscaffoldkey = GlobalKey<ScaffoldState>();
  
   final TextEditingController textnamecontroller = TextEditingController();
   final TextEditingController passwordcontroller = TextEditingController();
   String get _email => textnamecontroller.text;
   String get _password => passwordcontroller.text;
    bool emailValid = true;

    bool passwordValid =true;

  @override
  void initState() {
    // 
    // LoadingScreen(duration: Duration(seconds: 5),pagenavigate: LoginPageUI.id);
    super.initState();
  }

  

  _submit() async {

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
   if(dontproceed){

      try{

      final existinguser = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      print(existinguser);

      if(existinguser.user != null){

        //  LoadingScreen(duration: Duration(seconds: 5),pagenavigate:ControlPanel.id);
        Navigator.pushNamed(context, ControlPanel.id);

      }
        }catch(e){
          showSnackBar(e);
          print(e);

        }
    } 
  // print('email = ${textnamecontroller.text} , password = ${passwordcontroller.text}');

}

  @override
  Widget build(BuildContext context) {
    
    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: false);

    //  emailValid = widget.emailValidator.isValid(_email);
    //  passwordValid = widget.passwordValidator.isValid(_password);

      return Scaffold(
        key: _loginscaffoldkey,
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
                              Padding(
                                padding: EdgeInsets.only(left:ScreenUtil().setWidth(32.0)),
                                child: SizedBox(
                                  width: ScreenUtil().setWidth(230),
                                  child: TextField(
                                    onChanged: (val){
                                      if(val != ''){
                                        setState(() {
                                          emailValid = true;
                                        });
                                      }
                                    },
                                    controller: textnamecontroller,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                    hintText: 'Username',
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
                                    keyboardType: TextInputType.text,
                                    controller: passwordcontroller,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                    errorText: passwordValid ? null : widget.passwordError,
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
                          FormSubmitButton(buttonType: 'SIGN IN',onPressed: _submit,),
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


 void showSnackBar(text){

      final snackbar = SnackBar(
        backgroundColor: Color(0xFF00a79b),
      content: Text(
          text,
          style: TextStyle(color:Colors.white,),
        ),
      );
    _loginscaffoldkey.currentState.showSnackBar(snackbar);

  }
}

