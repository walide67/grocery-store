import 'package:flutter/material.dart';

class OrderList extends StatefulWidget {
  @override
  _OrderListState createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Order List"),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map<Widget>((item) {
            return Builder(builder: (BuildContext context) {
              return Container(
                  margin: EdgeInsets.symmetric(vertical: 7, horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 10.0,
                        color: Colors.grey[400],
                        offset: Offset(2.0, 2.0),
                        spreadRadius: 3.0)
                  ]),
                  child: ListTile(
                      title: Text("Order #$item"),
                      subtitle: Text("12/11/2019"),
                      onTap: () {},
                      trailing: Container(
                        width: 140.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                                child: Container(
                                    padding: EdgeInsets.all(3.0),
                                    decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                    ),
                                    child: Text(
                                      "in progress",
                                      overflow: TextOverflow.fade,
                                      textAlign: TextAlign.center,
                                      softWrap: false,
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.0)),
                            InkWell(
                              child: Icon(
                                Icons.delete,
                                color: Colors.red[600],
                              ),
                            ),
                          ],
                        ),
                      )));
            });
          }).toList(),
        ));
  }
}
