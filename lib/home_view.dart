import 'package:firstapp/screens/login.dart';
import 'package:firstapp/screens/profil.dart';
import 'package:firstapp/screens/signup.dart';
import './screens/search.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "./itemsList_view.dart";
import "./componants/Navbar_view.dart";

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState(title);
}

class _HomePageState extends State<HomePage> {
  final title;
  _HomePageState(this.title);
  List<Widget> _getSliderImages(BuildContext context) {
    List<Widget> imagesList = List<Widget>();
    imagesList.add(Image.asset(
      'images/banner1.jpg',
      fit: BoxFit.fill,
    ));
    imagesList.add(Image.asset(
      'images/banner2.png',
      fit: BoxFit.fill,
    ));
    imagesList.add(Image.asset(
      'images/banner1.jpg',
      fit: BoxFit.fill,
    ));
    imagesList.add(Image.asset(
      'images/banner2.png',
      fit: BoxFit.fill,
    ));
    return imagesList;
  }

  Widget _sliderImage() {
    List<Widget> images = _getSliderImages(context);
    return CarouselSlider(
        height: MediaQuery.of(context).size.height / 3,
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: image,
              );
            },
          );
        }).toList(),
        autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          title,
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              }),
        ],
        elevation: 5.0,
        backgroundColor: Colors.yellow,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: TextTheme(
            title: TextStyle(
                color: Colors.black, fontFamily: "PTSans", fontSize: 20.0)),
      ),
      drawer: Drawer(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
              height: 150.0,
              child: DrawerHeader(
                  child: Align(
                      alignment: Alignment.center, child: Text("Djibli+")),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ))),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("LogIn"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profil"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.person_add),
            title: Text("Sign-up"),
            onTap: () {
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Signup()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.report_problem),
            title: Text("Terms & Conditions"),
            onTap: () {},
          ),
        ],
      )),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: ListView(
            children: <Widget>[
              _sliderImage(),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                padding: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Top serve Today",
                            style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: "PTSans",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ItemsList(itemlist: [
                    "images/products/product1.jpg",
                    "images/products/product2.jpg",
                    "images/products/product3.jpg",
                    "images/products/product4.jpg",
                    "images/products/product1.jpg"
                  ]),
                ]),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 0,
      ),
    );
  }
}
