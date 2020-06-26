import 'package:flutter/material.dart';
import "../componants/Navbar_view.dart";

class Cateroriesview extends StatefulWidget {
  final categories;
  Cateroriesview({Key key, this.categories}) : super(key: key);

  @override
  _CateroriesviewState createState() => _CateroriesviewState();
}

class _CateroriesviewState extends State<Cateroriesview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          elevation: 5.0,
          leading: InkWell(child:Icon(Icons.arrow_back),
           onTap:(){Navigator.pop(context);}),
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: TextTheme(
              title: TextStyle(
                  color: Colors.black, fontFamily: "PTSans", fontSize: 20.0)),
        ),
        body: Stack(
          
          children: <Widget>[
            Container(
              color: Colors.red,
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height,
            ),
            ListView(
              children: widget.categories.map<Widget>((category) {
                return Builder(builder: (BuildContext context){
                  return Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 80.0,
                    width: MediaQuery.of(context).size.width * 0.85,
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7, // soften the shadow
                          spreadRadius: 2, //extend the shadow
                          offset: Offset(
                            4.0, // Move to right 10  horizontally
                            4.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    ),
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                            top: 10,
                            left: -30,
                            child: Center(
                              child: new Container(
                                  width: 60,
                                  height: 60,
                                  padding: EdgeInsets.all(5.0),
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
                                            category,
                                          )))),
                            )),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.75,
                                alignment: Alignment.center,
                                padding: EdgeInsets.only(top: 20.0),
                                child: Center(
                                  child: Column(
                                    children: <Widget>[
                                      Text("Categorie name", style: 
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.black
                                        )),
                                        Text("100 Items", style: 
                                      TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey
                                        )),
                                    ],)
                                ),
                              )
                              )
                      ],
                    ),
                  ),
                );
                });
              }).toList(),
            )
          ],
        ),
        bottomNavigationBar: NavBar(selectedIndex: 1),
        );
  }
}
