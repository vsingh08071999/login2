import 'package:flutter/material.dart';
import 'package:loginapp/screens/teacher_role.dart';
import '../models/model.dart';

class TeacherDashBoard extends StatefulWidget {
  final User user;
  TeacherDashBoard(this.user);
  @override
  _TeacherDashBoardState createState() => _TeacherDashBoardState();
}

Map<int, Color> color = {};
MaterialColor mainHeading = MaterialColor(0xFFc6e3eb, color);

class _TeacherDashBoardState extends State<TeacherDashBoard> {
  _drawerHeader() {
    return DrawerHeader(
      child: Text(
        'Teacher',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
        ),
      ),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Colors.black, spreadRadius: 2)],
        color: Colors.deepOrangeAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Teacher DashBoard'),
          ),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width,
                    child: _drawerHeader()),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          '${widget.user.rights[index].createTest}',
                          style: TextStyle(fontSize: 25),
                        ),
                        subtitle: Text(
                          'Url: ${widget.user.rights[index].viewTests}',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeacherRole(
                                      '${widget.user.rights[index].createTest}')));
                        },
                      );
                    },
                    itemCount: widget.user.rights.length,
                  ),
                )
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: mainHeading,
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://uinterview.com/wp-content/uploads/2015/09/Kai_Greene.jpg'),
                  maxRadius: 50,
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  width: 8,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      'Vishal Singh',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.black,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'RIET',
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 4,
                      width: 5,
                    ),
                    Text(
                      'B.Tech (Computer Science)',
                      softWrap: true,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
