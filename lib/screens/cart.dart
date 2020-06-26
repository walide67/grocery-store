import 'package:firstapp/componants/InputNumber.dart';
import 'package:firstapp/componants/Navbar_view.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List cartList = [1, 2, 3, 4, 5, 2, 3, 4, 5];
  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      body: ListView.builder(
        itemCount: cartList.length,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        itemBuilder: (context, index) {
          return Dismissible(
              key: ObjectKey(cartList[index]),
              background: stackBehindDismiss(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  cartList.removeAt(index);
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Item Deleted"),
                    action: SnackBarAction(label: "Undo",
                     onPressed: (){

                     }),
                    )
                  );
                });
              },

              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        color: Colors.grey[300],
                        offset: Offset(2, 2),
                        spreadRadius: 10)
                  ]),
                  child: ListTile(
                    leading: Image.asset("images/products/product1.jpg"),
                    title: Text("item name"),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "50 DA",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("avelible in 50 L"),
                      ],
                    ),
                    trailing: Container(
                      width: 90.0,
                      child: InputNumber(),
                    ),
                  )));
        },
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: 2,
      ),
    );
  }
}
