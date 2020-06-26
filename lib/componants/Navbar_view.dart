import 'package:firstapp/home_view.dart';
import 'package:firstapp/screens/cart.dart';
import 'package:firstapp/screens/categories_view.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  int selectedIndex;
  NavBar({Key key, this.selectedIndex}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5.0,
      selectedItemColor: Colors.red,
      selectedLabelStyle: TextStyle(color: Colors.red),
      currentIndex:
          widget.selectedIndex, // this will be set when a new tab is tapped
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.category),
          title: new Text('Categories'),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), title: Text('My Cart'))
      ],

      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(title: "Djibli+",)),
            );
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Cateroriesview(categories: [
                        "images/categories/cat3.png",
                        "images/categories/cat4.png",
                        "images/categories/cat1.png",
                        "images/categories/cat2.png",
                        "images/categories/cat3.png",
                        "images/categories/cat4.png",
                      ])),
            );
            break;
          case 2:
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Cart()));
            break;
          default:
            if (widget.selectedIndex != 0) {
              Navigator.pop(context);
            }
        }
        setState(() {
          widget.selectedIndex = index;
        });
      },
    );
  }
}
