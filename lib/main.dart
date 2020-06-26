// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import './home_view.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Djibli+",
      color: Colors.white,
      theme: ThemeData(
        primaryColor: Colors.yellow,
        accentColor: Colors.yellowAccent,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0)),
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          labelStyle: TextStyle(
            color: Colors.black
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.teal, width: 2.0),
            borderRadius: BorderRadius.circular(10.0),
          ),
          
        )
      ),
      home: HomePage(title: "Djibli+",),
    ),

    );
    
  }
}




