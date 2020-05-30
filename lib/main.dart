import 'package:flutter/material.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/screens/loginscreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MaterialApp(
    //home: QuestionScreen(),
    home: LoginDemo(),
    //home: Dashboard(),
    debugShowCheckedModeBanner: false,
  ));
}
