import 'package:flutter/material.dart';
import 'package:roomcontrol/control_panel.dart';
import 'package:roomcontrol/rooms_page.dart';
import 'package:roomcontrol/signup_page.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:Colors.black,
        accentColor: Colors.black,
        // primarySwatch: Colors.blue,
        fontFamily: 'DejaVu Sans',
      ),
      // home: LoginPageUI(),
      initialRoute: LoginPageUI.id,
      routes: {
        LoginPageUI.id : (context) => LoginPageUI(),
        SignupUI.id : (context) => SignupUI(),
        ControlPanel.id :(context) => ControlPanel(),
        RoomsPage.id : (context) => RoomsPage(),
      },
    );
  }
}
