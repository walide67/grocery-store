import 'package:flutter/material.dart';

class PersonalInfos extends StatefulWidget {
  @override
  _PersonalInfosState createState() => _PersonalInfosState();
}

class _PersonalInfosState extends State<PersonalInfos> {
  bool _buttonDisabled;
  bool disable;
  @override
  void initState() {
    super.initState();
    _buttonDisabled = true;
    disable = true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          RaisedButton(
            onPressed: _buttonDisabled ? null : () {},
            color: Colors.red[600],
            textColor: Colors.white,
            disabledTextColor: Colors.grey[800],
            disabledColor: Colors.grey[400],
            child: Text("save"),
          ),
        ],
        title: Text(
          "Personal Informations",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(10.0),
              margin: EdgeInsets.only(top: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RowInfo(
                    ctx: context,
                    labelText: 'First name',
                    value: "Abdelkadir",
                    parent: this,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  RowInfo(
                    ctx: context,
                    labelText: 'Last name',
                    value: "Tlemcani",
                    parent: this,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Text("Personal Address", style: 
                  TextStyle(
                    fontWeight: FontWeight.bold
                  ),),
                  Padding(padding: EdgeInsets.all(5.0)),
                  RowInfo(
                    ctx: context,
                    labelText: 'House N°',
                    value: "40",
                    inputType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false
                    ),
                    parent: this,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  RowInfo(
                    ctx: context,
                    labelText: 'Zip code',
                    value: "02043",
                    inputType: TextInputType.numberWithOptions(
                      decimal: false,
                      signed: false
                    ),
                    parent: this,
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                  RowInfo(
                    ctx: context,
                    labelText: 'Address',
                    value: "Tadjena, Chlef",
                    parent: this,
                    feildIcon: Icon(Icons.map, color: Colors.black,),
                  ),
                  Padding(padding: EdgeInsets.all(5.0)),
                ],
              ))
        ],
      ),
    ),
       onWillPop: ()async{
         if(_buttonDisabled){
           return true;
         }else{
           return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit whithout saving the changes'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
         }
       });
  }
}

class RowInfo extends StatefulWidget {
  final Icon feildIcon;
  final String labelText;
  final String value;
  final TextInputType inputType;
  final BuildContext ctx;
  final _PersonalInfosState parent;
  const RowInfo(
      {Key key,
      this.feildIcon = const Icon(Icons.edit, color: Colors.black,),
      this.labelText,
      this.value,
      this.ctx,
      this.parent,
      this.inputType = TextInputType.text,
      })
      : super(key: key);
  @override
  _RowInfoState createState() => _RowInfoState();
}

class _RowInfoState extends State<RowInfo> {
  bool readOnly;
  Icon feildIcon;
  @override
  void initState() {
    super.initState();
    readOnly = true;
    feildIcon = widget.feildIcon;
  }

  @override
  Widget build(ctx) {
    double labelWidth = MediaQuery.of(ctx).size.width * 0.25;
    double feildWidth = MediaQuery.of(ctx).size.width * 0.65;
    return Row(
      children: <Widget>[
        Container(
          width: labelWidth,
          child: Text(widget.labelText),
        ),
        Container(
          width: feildWidth,
          child: TextFormField(
            onFieldSubmitted: (text) {
              setState(() {
                readOnly = true;
                feildIcon = widget.feildIcon;
              });
            },
            onChanged: (text) {
              this.widget.parent.setState(() {
                this.widget.parent._buttonDisabled = false;
              });
            },
            initialValue: widget.value,
            readOnly: readOnly,
            keyboardType: widget.inputType,
            decoration: InputDecoration(
              
                hintText: widget.value,
                suffixIcon: InkWell(
                  child: feildIcon,
                  onTap: () {
                    setState(() {
                      readOnly = !readOnly;
                      feildIcon = Icon(Icons.check, color: Colors.green,);
                    });
                  },
                )),
          ),
        ),
      ],
    );
  }
}
