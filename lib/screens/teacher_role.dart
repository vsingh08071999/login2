import 'package:flutter/material.dart';

class TeacherRole extends StatelessWidget {
  String role;
  TeacherRole(this.role);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${role}',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
