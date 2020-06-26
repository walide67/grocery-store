import 'package:flutter/material.dart';
import '../itemsList_view.dart';

class WishList extends StatefulWidget {
  @override
  _WishListState createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        title: Text("Wish List"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(padding: EdgeInsets.all(10.0)),
          ItemsList(itemlist: [
                    "images/products/product1.jpg",
                    "images/products/product2.jpg",
                    "images/products/product3.jpg",
                    "images/products/product4.jpg",
                    "images/products/product1.jpg"
                  ]),
        ],
      ),
      ), 
      onWillPop: () async{
        return true;
      });
  }
}