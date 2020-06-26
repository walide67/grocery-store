import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: () {})
        ],
        title: Container(
          
          child: TextFormField(
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white54,
              hintText: 'Search Products',
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 5.0, top: 5.0),
              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: new BorderRadius.circular(25),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: Colors.white),
                borderRadius: new BorderRadius.circular(25),
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("No Product Found!"),
      ),
    );
  }
}
