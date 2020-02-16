import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulbsBox extends StatelessWidget {

  // final String imagename;
  final String boxname;
  final Color color1;
  final Color color2;
  final Color color3;
  final Color color4;

  BulbsBox({this.boxname,this.color1,this.color2,this.color3,this.color4});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: boxname =='Birthday' || boxname == 'Relax' ? EdgeInsets.only(right: ScreenUtil().setWidth(12)):
      EdgeInsets.only(left: ScreenUtil().setWidth(12)),
      height: ScreenUtil().setHeight(70),
      width :ScreenUtil().setWidth(150),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors:<Color>[
                  color1,
                  color2,
                  color3,
                  color4,
                ],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15.0)),),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset('assets/images/surface1.png'),
          Text(boxname,style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(15),
            fontWeight: FontWeight.w600
            ),
          ),
        ],
      ),
    );
  }
}