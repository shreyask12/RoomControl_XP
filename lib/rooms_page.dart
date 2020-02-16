import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roomcontrol/control_panel.dart';
import 'package:roomcontrol/widgets/bulbs_box.dart';
import 'package:roomcontrol/widgets/lamp_paint.dart';

class RoomsPage extends StatefulWidget {

  static String id = 'roomspage';

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {

  double _lightopacity = 1.0;

  List<Color> colorContainer = [
    Color(0xFFff9b9b),
    Color(0xFF94eb9e),
    Color(0xFF94caeb),
    Color(0xFFa594eb),
    Color(0xFFde94eb),
    Color(0xFFebd094),
    Color(0xFFffffff),
  ];

  List lightsContent = [
    {'image' : 'surface2.png','light' : 'Main Light'},
    {'image' : 'furniture-and-household.png','light' : 'Desk lights'},
    {'image' : 'bed (1).png','light' : 'Bed Light'},
    {'image' : 'surface2.png','light' : 'Room Light'},
  ];

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

    ScreenUtil.init(context, width: 360, height: 720, allowFontScaling: false);
    return Scaffold(
      // backgroundColor: Color(0xffffffff),
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
      body: SingleChildScrollView(
          child: Container(
            height: ScreenUtil().setHeight(720),
            width: ScreenUtil().setWidth(360),
            child: Stack(
              alignment: Alignment.topCenter,
              children:<Widget>[
                Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(20)),
                  height: ScreenUtil().setHeight(300),
                  width: ScreenUtil().setWidth(360),
                  decoration: BoxDecoration(
                    color: Color(0xff042c38),
                    image:DecorationImage(
                      image: AssetImage('assets/images/Group 63.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(top: ScreenUtil().setWidth(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right:ScreenUtil().setWidth(10.0)),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.pushNamed(context, ControlPanel.id);
                                    },
                                    child: Image.asset('assets/images/Icon ionic-md-arrow-round-back.png')),
                                ),
                                Text('Bed',style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight:FontWeight.w600,color: Colors.white) , ),
                                ],
                              ),
                              // CustomPaint(
                              //   painter: RectanglePainter(
                              //     strokeColor: Colors.blue,
                              //     strokeWidth: 10,
                              //     paintingStyle: PaintingStyle.fill,
                              //   ),
                              //   child: Container(
                              //     height: 180,
                              //     width: 200,
                              //   ),
                              // ),
                              ],
                            ),
                            ),
                          ),
                          Text('Room', style: TextStyle(fontSize: ScreenUtil().setSp(30),fontWeight:FontWeight.w600,color: Colors.white) ,),
                          Text('4 Lights',style: TextStyle(fontSize: ScreenUtil().setSp(15),fontWeight:FontWeight.normal,color: Color(0xffffab3d),) ,),
                          Padding(
                            padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                            child: Container(
                              height: ScreenUtil().setWidth(50),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:  lightsContent.length,
                                itemBuilder: (BuildContext context,int index){
                                  return GestureDetector(
                                    child: Padding(
                                      padding: EdgeInsets.only(right:ScreenUtil().setWidth(10)),
                                      child: Container( 
                                        height: ScreenUtil().setWidth(60),
                                        width: ScreenUtil().setWidth(120),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          color: lightsContent[index]['light'] == 'Desk lights' ? Color(0xff00a79b) : Colors.white,
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Image.asset('assets/images/${lightsContent[index]['image']}'),
                                            Text(lightsContent[index]['light'],style: TextStyle(
                                              color:lightsContent[index]['light'] == 'Desk lights' ? Colors.white : Color(0xff00a79b),
                                              fontWeight: FontWeight.w600,
                                             ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: (){
                                      //  print(lightsContent[index]);

                                    },
                                  );
                                }
                              ),
                            ),
                          ),
                        ],
                    ),
                  ),
                  Positioned(
                    top:ScreenUtil().setWidth(190),
                    right:ScreenUtil().setWidth(30),
                    child: Image.asset('assets/images/Icon awesome-power-off.png'),),
                  Positioned(
                    bottom: ScreenUtil().setWidth(45),
                    top: ScreenUtil().setWidth(200),
                    child: Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(30)),
                      width:ScreenUtil().setWidth(360),
                      height: ScreenUtil().setHeight(550),
                      decoration: BoxDecoration(
                        color:Color(0xfff6f8fb),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.only(
                          topLeft:Radius.circular(ScreenUtil().setWidth(30.0)),
                           topRight: Radius.circular(ScreenUtil().setWidth(30.0)),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Intensity',style: TextStyle(
                            color:Color(0xff002d67),
                            fontWeight: FontWeight.w700,
                            package: 'DejaVu Sans-Bold',
                            fontSize: ScreenUtil().setSp(20),
                            letterSpacing: ScreenUtil().setWidth(1.0)
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(child: 
                              Image.asset('assets/images/solution.png'),
                              ),
                              Expanded(
                                flex: 10,
                                child:SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Color(0xffffab3d),
                                    inactiveTrackColor: Color(0xffa6a6a6),
                                    // trackShape: RectangularSliderTrackShape(),
                                    // trackHeight: 4.0,
                                    thumbColor: Colors.white,
                                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                                    overlayColor: Color(0xffa6a6a6).withAlpha(32),
                                    overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                                  ),
                                child: Slider(
                                  value: _lightopacity, 
                                  max: 1.0,
                                  min: 0.5,
                                  // activeColor: Color(0xffffab3d),
                                  // inactiveColor: Color(0xffa6a6a6),
                                  
                                  onChanged: (value){
                                    // print(value);
                                    setState(() {
                                      _lightopacity = value;
                                    });
                                  },
                                ),
                                ),
                              ),
                              Expanded(
                                child: Opacity(
                                  opacity: _lightopacity,
                                  // child:
                                  // ShaderMask(
                                  //   child: Image.asset('assets/images/solution-1.png'),
                                  //   shaderCallback: (Rect bounds){
                                  //     return LinearGradient(colors: [Color(0xffffab3d)],stops:[_lightopacity]
                                  //     ).createShader(bounds);
                                  //   },
                                  // ),
                                   child: Image.asset('assets/images/solution-1.png',),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top : ScreenUtil().setWidth(10),bottom: ScreenUtil().setWidth(10)),
                            child: Text('Colors',
                            style: TextStyle(
                              color:Color(0xff002d67),
                              fontWeight: FontWeight.w700,
                              package: 'DejaVu Sans-Bold',
                              fontSize: ScreenUtil().setSp(20),
                              letterSpacing: ScreenUtil().setWidth(1.0)
                              ),
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(40),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:  colorContainer.length,
                              itemBuilder: (BuildContext context,int index){
                                return GestureDetector(
                                  child: Padding(
                                    padding: EdgeInsets.only(right:ScreenUtil().setWidth(10)),
                                    child: Material(
                                      child: Container(
                                        height: ScreenUtil().setWidth(30),
                                        width: ScreenUtil().setWidth(30),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colorContainer[index],
                                        ),
                                        child: colorContainer[index] == Color(0xFFffffff) ? Center(child: Image.asset('assets/images/+.png')) : null,
                                      ),
                                    ),
                                  ),
                                  onTap: (){
                                     print(colorContainer[index]);
                                  },
                                );
                              }
                            ) 
                          ),
                          Padding(
                            padding: EdgeInsets.only(top : ScreenUtil().setWidth(10),bottom: ScreenUtil().setWidth(10)),
                            child:
                          Text('Scenes',
                            style: TextStyle(
                              color:Color(0xff002d67),
                              fontWeight: FontWeight.w700,
                              package: 'DejaVu Sans-Bold',
                              fontSize: ScreenUtil().setSp(20),
                              letterSpacing: ScreenUtil().setWidth(1.0)
                              ),
                            ),
                          ),
                          Expanded(
                            
                            child: Row(
                               children: <Widget>[
                                 Expanded(
                                  child: BulbsBox(boxname: 'Birthday',
                                   color1: Color(0xffff9d9a),color2: Color(0xffffa698),
                                   color3: Color(0xffff9e9a),color4:Color(0xffffb593) ,
                                   ),
                                 ),
                                 Expanded(
                                    child: BulbsBox(
                                     boxname: 'Party',
                                   color1: Color(0xffa693eb),color2: Color(0xffd193eb),
                                   color3: Color(0xffc893eb),color4:Color(0xffad93eb),
                                   ),
                                 ),
                               ],
                             ),
                          ),
                          
                          Expanded(
                          child: Row(     
                            children: <Widget>[
                              Expanded(
                                child: BulbsBox(
                                  boxname: 'Relax',
                                color1: Color(0xff93cceb),color2: Color(0xff93daeb),
                                color3: Color(0xff93caeb),color4:Color(0xff93d7eb)
                                ),
                              ),
                              Expanded(
                                child: BulbsBox(
                                  boxname: 'Fun',
                                color1: Color(0xff8dde94),color2: Color(0xff89dd94),
                                color3: Color(0xffb4e992),color4:Color(0xffaee793) ,
                                ),
                              ),
                            ],
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
            
  }
}