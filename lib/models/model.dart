import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class User {
  int uid;
  String userid;
  String roleName;
  String message;
  double tokenId;
  List<Rights> rights;
  User({this.uid, this.userid, this.roleName, this.message, this.rights});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json['uid'],
        userid: json['uderid'],
        roleName: json['roleName'],
        message: json['message'],
        //tokenId: json['tokenId'] as double,
        rights: parseRights(json));
  }
  static List<Rights> parseRights(parseJson) {
    var list = parseJson['rights'] as List;
    List<Rights> rightsList =
        list.map((data) => Rights.fromJson(data)).toList();
    return rightsList;
  }
}

class Rights {
  String createTest;
  String viewTests;
  String addQuestion;
  String viewQuestion;
  String createGroup;
  String viewGroup;
  Rights(
      {this.createTest,
      this.viewTests,
      this.addQuestion,
      this.viewQuestion,
      this.createGroup,
      this.viewGroup});
  factory Rights.fromJson(Map<String, dynamic> parseJson) {
    return Rights(
        createTest: parseJson['name'],
        viewTests: parseJson['url'],
        addQuestion: parseJson['name'],
        viewQuestion: parseJson['url'],
        createGroup: parseJson['name'],
        viewGroup: parseJson['url']);
  }
}
