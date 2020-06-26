import 'package:flutter/material.dart';
import './componants/InputNumber.dart';

class ItemsList extends StatefulWidget {
  final List itemlist;
  ItemsList({Key key, this.itemlist}) : super(key: key);
  @override
  _ItemsListState createState() => _ItemsListState();
}
class _ItemsListState extends State<ItemsList> {
  _ItemsListState();
  _showBttomSheet(item) {
    showBottomSheet(
        context: context,
        backgroundColor: Colors.black26,
        builder: (builder) {
          return new LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                     
                    ),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                            top: -100,
                            child: Center(
                              child: new Container(
                                  width: 200,
                                  height: 200,
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
                                              item,)))),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 110.0, bottom: 20.0),
                            alignment: Alignment.bottomCenter,
                            child: ListView(children: <Widget>[
                              Center(
                                child: Text(
                                  "Item name",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(5.5)),
                              Center(
                                child: Text(
                                  "item description ..",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14.0,
                                    fontFamily: 'Montserrat',
                                  ),
                                ),
                              ),
                              Padding(padding: EdgeInsets.all(5.5)),
                              Center(
                                  child: Container(
                                width: 200.0,
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "Prix : ",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "50 Da",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.bold,
                                            decoration:
                                                TextDecoration.lineThrough,
                                                decorationColor: Colors.red,
                                                decorationStyle: TextDecorationStyle.solid,
                                                decorationThickness: 3.0
                                                ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "30 Da",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )),
                              Padding(padding: EdgeInsets.all(5.5)),
                              Center(
                                  child: Container(
                                width: 250.0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Quentity ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    InputNumber(),
                                  ],
                                ),
                              )),
                              Padding(padding: EdgeInsets.all(20)),
                              Center(
                                child: Container(
                                  width: 140.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RaisedButton(
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          Icon(
                                            Icons.add_shopping_cart,
                                            color: Colors.white,
                                          ),
                                          Text("Add to Card", ),
                                        ],
                                      ),
                                      textColor: Colors.white,
                                      elevation: 5.0,
                                      color: Colors.red[600]),
                                    ],
                                  )
                                ),
                              ),
                            ]))
                      ],
                    )));

            //container
          }); //layout
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemWidth = size.width / 2;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    return Container(
      child: new GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1,
        controller: new ScrollController(keepScrollOffset: false),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(), // to disable GridView's scrolling
        children: widget.itemlist.map<Widget>((item) {
          return Builder(builder: (BuildContext context) {
            return Container(
              height: itemWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 7, // soften the shadow
                    spreadRadius: 2, //extend the shadow
                    offset: Offset(
                      -2.0, // Move to right 10  horizontally
                      -1.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
              ),
              margin: EdgeInsets.all(7.0),
              padding: EdgeInsets.all(2.0),
              child: Column(children: <Widget>[
                Expanded(
                    flex: 9,
                    child: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                           
                        Container(
                          width: 100.0,
                          height: itemWidth/2,
                          child: Image.asset(item)
                        )
                        ,
                        Positioned(
                            top: 10,
                            left: -((itemWidth/2)-40),
                            child: RotationTransition(
                              turns: new AlwaysStoppedAnimation(-45 / 360),
                              child: ClipPath(
                                child: Container(
                                  padding:
                                      EdgeInsets.only(left: 15.0, right: 15.0),
                                  color: Colors.red,
                                  child: Text("Promo",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                clipper: CustomClipPath(),
                              ),
                            )),
                        
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Column(children: <Widget>[
                      Row(children: <Widget>[
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Item name',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Item description ..',
                                  style: TextStyle(
                                      fontSize: 12.0, color: Colors.black))
                            ],
                          ),
                        ),
                        Text('50 Da',
                            style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ]),
                      Container(
                          margin: EdgeInsets.only(top: 7.0),
                          child: Theme(
                              data: Theme.of(context)
                                  .copyWith(canvasColor: Colors.transparent),
                              child: FlatButton(
                                onPressed: () {
                                  _showBttomSheet(item);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.add_shopping_cart,
                                        color: Colors.red),
                                    Text(
                                      "Add to cart",
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)),
                              )))
                    ])),
              ]),
            );
          });
        }).toList(),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.25, 0.0);
    path.lineTo(size.width * 0.75, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
