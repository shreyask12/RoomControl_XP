import 'package:flutter/material.dart';
import 'widgets/rooms_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ControlPanel extends StatefulWidget {
  
  static String id = 'control-panel';

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {

  int _selectedIndex = 0;
static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
static const List<Widget> _widgetOptions = <Widget>[
  Text(
    'Index 0: Home',
    style: optionStyle,
  ),
  Text(
     'Index 1: Business',
     style: optionStyle,
  ),
  Text(
     'Index 2: School',
     style: optionStyle,
  ),
];

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}



  @override
  Widget build(BuildContext context) {

    ScreenUtil.init(context,width: 360,height: 720,allowFontScaling: true);

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage('assets/images/bulb.png')
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage('assets/images/Icon feather-home.png')
          ),
          title: Text(''),
        ),
        BottomNavigationBarItem(
          icon:ImageIcon(
            AssetImage('assets/images/Icon feather-settings.png')
          ),
          title: Text(''),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF00a79b),
      onTap: _onItemTapped,
    ),
      body: Container(
      
        width:ScreenUtil().setWidth(360),
        height: ScreenUtil().setHeight(720),
        child: SingleChildScrollView(
          child: Container(
             height: ScreenUtil().setHeight(720),
          width: ScreenUtil().setWidth(360),
            child: Stack(
              children:<Widget>[
                Container(
                  height: ScreenUtil().setHeight(200),
                  width: ScreenUtil().setWidth(360),
                  decoration: BoxDecoration(
                    color: Color(0xff042c38),
                    image:DecorationImage(
                      image: AssetImage('assets/images/Group 63.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
                          child: Text('''Control 
Panel''', style: TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight:FontWeight.bold,color: Colors.white) , ),
                        ),
                        Image.asset('assets/images/user.png'),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: ScreenUtil().setWidth(0),
                  child: Container(
                    padding: EdgeInsets.all(ScreenUtil().setWidth(25)),
                    width: ScreenUtil().setWidth(360),
                    height: ScreenUtil().setHeight(600),
                    decoration: BoxDecoration(
                      color: Color(0xfff6f8fb),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(ScreenUtil().setWidth(30.0)),
                         topRight: Radius.circular(ScreenUtil().setWidth(30.0)),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('All Rooms',style: TextStyle(
                          color: Color(0xff012e67),
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(20),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RoomsBox(roomname: 'Bed Room', imagename: 'bed.png',lightCount: '4 Lights',
                                 onPressed : (){ goTorooms(context,'bedroom');}),
                              ),
                              Expanded(
                                child: RoomsBox(roomname: 'Living Room', imagename: 'room.png',lightCount: '2 Lights',
                                onPressed : (){goTorooms(context,'livingroom');}),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RoomsBox(roomname: 'Kitchen', imagename: 'kitchen.png',lightCount: '5 Lights',
                                onPressed :(){ goTorooms(context,'kitchen');}
                               ),
                              ),
                              Expanded(
                                child: RoomsBox(roomname: 'BathRoom', imagename: 'bathtube.png',lightCount: '1 Light',
                                 onPressed :(){ goTorooms(context,'bathroom');}
                                ),
                              ),
                            ],
                          ), 
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: RoomsBox(
                                  roomname: 'Outdoor', imagename: 'house.png',lightCount: '5 Lights',
                                  onPressed: (){goTorooms(context,'outdoor');}
                                ),
                              ),
                              Expanded(
                                child: RoomsBox(
                                  roomname: 'Balcony', imagename: 'bed.png',lightCount: '2 Lights',
                                  onPressed: (){goTorooms(context,'balcony');}
                                ),
                              ),
                            ],
                          ), 
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}

