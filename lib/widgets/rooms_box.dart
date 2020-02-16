import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomcontrol/rooms_page.dart';

class RoomsBox extends StatelessWidget {

 final String imagename;
 final String roomname;
 final String lightCount;
 final Function onPressed;

  const RoomsBox({@required this.imagename,@required this.lightCount, @required this.roomname,@required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
          child: Container(
          margin: EdgeInsets.all(ScreenUtil().setWidth(7)),
          padding: EdgeInsets.all(15),
          width: ScreenUtil().setWidth(150),
          height: ScreenUtil().setWidth(150),
          decoration: BoxDecoration(
            color: Color(0xffffffff),
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:<Widget> [
              Image.asset('assets/images/$imagename',filterQuality: FilterQuality.high),
              Padding(
                padding: EdgeInsets.only(top:ScreenUtil().setWidth(20)),
                child: Text(roomname,style: TextStyle(
                    color: Color(0xff3b3b3b),
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(15,allowFontScalingSelf: true),
                  ),
                ),
              ),
              Text(lightCount,style: TextStyle(
                  color: Color(0xffffab3d),
                  fontWeight: FontWeight.normal,
                  package: 'DejaVu Sans',
                ),
              ),
            ],
          ),
        // ),
      ),
    );
  }
}

goTorooms(context,val){

Navigator.pushNamed(context, RoomsPage.id);

}