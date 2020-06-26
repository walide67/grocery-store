import 'package:flutter/material.dart';

class InputNumber extends StatefulWidget {
  InputNumber({Key key}) : super(key: key);

  @override
  _InputNumberState createState() => _InputNumberState();
}

class _InputNumberState extends State<InputNumber> {
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
     _controller.text = "1";
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Row(
         children: <Widget>[
           Container(
             decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                
                color: Colors.red,
              ),
             height: 40.0,
             width: 30.0,
             padding: EdgeInsets.only(left:5.0, right: 5.0),
             child: InkWell(
                  onTap: (){
                    int currentState = int.parse(_controller.text);
                    setState((){
                      currentState--;
                      _controller.text = (currentState > 0?currentState:1).toString();
                    });
                  },
                  child: Icon(Icons.remove, color: Colors.white, size: 20.0,),
                ),
           ),
           Container(
             color: Colors.red,
             width: 30.0,
             height: 40.0,
             child:TextFormField(
                    decoration: InputDecoration(
                      contentPadding:EdgeInsets.all(3.0),
                    ),
                    enabled: false,
                    controller: _controller,
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold
                    ),
                    
                    textAlign: TextAlign.center,
                    textAlignVertical: TextAlignVertical.center,
                    
                    ),
                  ),
           Container(
             decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white,
                    width: 0.5,
                  ),
                ),
                color: Colors.red,
              ),
             
             height: 40.0,
             width: 30,
             padding: EdgeInsets.only(left:5.0, right: 5.0),
             child:InkWell(
                  onTap: (){
                    int currentState = int.parse(_controller.text);
                    setState((){
                      currentState++;
                      _controller.text = (currentState).toString();
                    });
                  },
                  child: Icon(Icons.add, color: Colors.white, size: 20.0,),
                ),
           ),
         ],
       ),
    );
  }
}