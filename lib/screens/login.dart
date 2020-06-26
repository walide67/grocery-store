import '../icons/custom_icons_icons.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _secure;
  @override
  void initState() {
    super.initState();
    _secure = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(0.0),
      children: <Widget>[
        CustomPaint(
          child: Container(
            height: 200.0,
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(bottom:45.0),
                  child: Text(
                  "Login",
                  style: TextStyle(fontSize: 40.0),
                )
                ) 
                ),
          ),
          painter: CurvePainter(),
        ),
        Container(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.black)),
            )),
        Container(
            padding: EdgeInsets.all(5.0),
            child: TextFormField(
              obscureText: _secure,
              decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _secure = _secure ? false : true;
                        });
                      },
                      child: Icon(Icons.remove_red_eye, color: Colors.black)),
                  suffixStyle: TextStyle(color: Colors.black)),
            )),
        Align(
          alignment: Alignment.center,
          child: Container(
              width: 130.0,
              padding: EdgeInsets.all(5.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.red[600],
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.exit_to_app, color: Colors.white, size: 30.0),
                      Text("Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              )),
        ),
        Container(
          padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){},
                child:Text("Forgot Password ?",style: TextStyle(color:Colors.teal))
              ),
              Text("  |  "),
              InkWell(
                onTap: (){},
                child:Text("Sign-up", style: TextStyle(color:Colors.red[700]),),
              )
            ],
          ) 
        ),
        Container(
          child: Center(
            child: Text(
            "Or login with social account "
          ),),
        ),
        Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 200,
                child:RaisedButton(
                onPressed: (){},
                color: Colors.blue,
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(CustomIcons.facebook_squared),
                    Text("Login with Facebook")
                  ],
                ),
                ),
              ),
              Container(
                width: 200,
                child:RaisedButton(
                color: Colors.red,
                textColor: Colors.white,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(CustomIcons.gplus),
                    Text("Login with Google")
                  ],
                ),
                )
              )
            ],
          )
        )
      ],
    ));
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();

    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.70,
        size.width * 0.17, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    path.quadraticBezierTo(size.width * 0.40, size.height * 0.40,
        size.width * 0.50, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.85,
        size.width * 0.65, size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);
    path.close();

    paint.color = Colors.yellow[100];
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.yellow[200];
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.55,
        size.width * 0.22, size.height * 0.70);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.90,
        size.width * 0.40, size.height * 0.75);
    path.quadraticBezierTo(size.width * 0.52, size.height * 0.50,
        size.width * 0.65, size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = Colors.yellow;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
