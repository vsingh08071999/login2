import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../server.dart';
import '../widgets/fgbutton.dart';
import '../widgets/loginbutton.dart';
import '../widgets/textfields.dart';
import '../models/model.dart';
import 'teachers_dashboard.dart';

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

Map<int, Color> color = {};
MaterialColor circleCustom = MaterialColor(0xFF1d499c, color);
MaterialColor backCustom = MaterialColor(0xFF9bcaf4, color);
MaterialColor buttonCustom = MaterialColor(0xFF2d228d, color);
MaterialColor facebookCustom = MaterialColor(0xFF1d499c, color);
MaterialColor googleCustom = MaterialColor(0xFFe25141, color);

class _LoginDemoState extends State<LoginDemo> {
  TextEditingController _tc1 = TextEditingController();
  TextEditingController _tc2 = TextEditingController();

  _getExamContainer() {
    return Container(
      padding: EdgeInsets.only(bottom: 108),
      color: backCustom,
      height: MediaQuery.of(context).size.height * 0.30,
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20,
            width: 7,
          ),
          CircleAvatar(
            child: Text(
              'Exam',
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            maxRadius: 38,
            backgroundColor: circleCustom,
          ),
          SizedBox(
            height: 20,
            width: 7,
          ),
          Text(
            'APP',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }

  _alertDialog(var info) {
    return showDialog(
        //barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
              actionsOverflowDirection: VerticalDirection.up,
              title: Text('LOGIN'),
              content: Text('Login Successfully'),
              actions: <Widget>[
                FlatButton(
                    onPressed: () async {
                      //var info = await Server.signIn(_tc1, _tc2);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TeacherDashBoard(info)));
                      // Navigator.of(context).pop();
                    },
                    child: Text('Ok'))
              ]);
        },
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _getExamContainer(),
              SizedBox(
                height: 7,
              ),
              Text('Sign In',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 7,
              ),
              TextFields(_tc1, false, 'Username'),
              TextFields(_tc2, true, 'Password'),
              SizedBox(
                height: 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(10),
                    child: FlatButton(
                      padding: EdgeInsets.all(5),
                      onPressed: () async {
                        var info = await Server.signIn(_tc1.text, _tc2.text);
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => Demo(info)));
                        _alertDialog(info);
                      },
                      splashColor: Colors.black38,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      color: buttonCustom,
                    ),
                  ),

                  //LoginButton(facebookCustom, Server.signIn),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 35,
                      ),
                      Text(
                        'Remember Me',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      FlatButton(
                        color: Colors.white24,
                        onPressed: () {},
                        splashColor: Colors.black,
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 30,
                        ),
                        FGButton('f', facebookCustom),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.32,
                        ),
                        FGButton('G', googleCustom)
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        "Don't have Account?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      FlatButton(
                        color: Colors.white24,
                        onPressed: () {},
                        splashColor: Colors.black,
                        child: Text(
                          'SignUp',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
