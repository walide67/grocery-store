import 'package:firstapp/icons/custom_icons_icons.dart';
import 'package:firstapp/screens/Accountinfos.dart';
import 'package:firstapp/screens/OrderList.dart';
import 'package:firstapp/screens/WishList.dart';
import 'package:firstapp/screens/personalInfos.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  Widget item({itemwidth, itemTitel, itemIcon, itemAction}) {
    return Container(
        width: itemwidth,
        height: itemwidth,
        padding: EdgeInsets.all(5.0),
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10.0,
                color: Colors.grey,
                spreadRadius: 2.0,
                offset: Offset(2.0, 2.0),
              )
            ],
            border: Border.all(
              color: Colors.white,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: Align(
            alignment: Alignment.center,
            child: InkWell(
                onTap: itemAction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      itemIcon,
                      size: 40.0,
                    ),
                    Text(
                      itemTitel,
                      textAlign: TextAlign.center,
                    )
                  ],
                ))));
  }

  @override
  Widget build(BuildContext context) {
    double itemswidth = MediaQuery.of(context).size.width * 0.40;
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        CustomPaint(
          child: Container(
            padding: EdgeInsets.only(top: 25.0),
            height: 300.0,
            child: Align(
                alignment: Alignment.center,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      new Container(
                          width: 150,
                          height: 150,
                          padding: EdgeInsets.all(50.0),
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 7, // soften the shadow
                                  spreadRadius: 2, //extend the shadow
                                  offset: Offset(
                                    0.0, // Move to right 10  horizontally
                                    4.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ],
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                  fit: BoxFit.contain,
                                  image: AssetImage(
                                    "images/user.jpeg",
                                  )))),
                      Container(
                          margin: EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                color: Colors.grey[800],
                                width: 5,
                                height: 45.0,
                              ),
                              Container(
                                  height: 45.0,
                                  color: Colors.grey[800],
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.all(10.0),
                                  child: Text(
                                    "Tlemcani Abdelkadir",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.0,
                                        letterSpacing: 3,
                                        color: Colors.white),
                                  )),
                            ],
                          )),
                      Container(
                          child: Text(
                        "+213795826193",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 16),
                      ))
                    ],
                  ),
                )),
          ),
          painter: CurvePainter(),
        ),
        Container(
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.only(top: 20.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    item(
                        itemTitel: "Personal Informations",
                        itemIcon: Icons.account_circle,
                        itemwidth: itemswidth,
                        itemAction: () {
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context)=> PersonalInfos()));
                        }),
                    item(
                        itemTitel: "Account Informations",
                        itemIcon: Icons.vpn_key,
                        itemwidth: itemswidth,
                        itemAction: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=>AccountInfos())
                          );
                        }),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    item(
                        itemTitel: "Orderds List",
                        itemIcon: Icons.format_list_bulleted,
                        itemwidth: itemswidth,
                        itemAction: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=>OrderList())
                          ); 
                        }),
                    item(
                        itemTitel: "Wish List",
                        itemIcon: CustomIcons.heart_empty,
                        itemwidth: itemswidth,
                        itemAction: () {
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context)=> WishList())
                          );
                        }),
                  ],
                ),
              ],
            ))
      ],
    ));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    path.lineTo(size.width - 5, 0);
    path.lineTo(0, size.height - 5);
    path.close();
    paint.color = Colors.red;
    canvas.drawPath(path, paint);
    path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.90, size.width * 0.5, size.height);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 1.10, size.width * 0.0, size.height);
    path.close();
    paint.color = Colors.yellow;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
