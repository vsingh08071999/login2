import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:loginapp/models/model.dart';

class Server {
  var jsonData;
  TextEditingController t1;
  TextEditingController t2;
  static signIn(t1, t2) async {
    //String url = 'http://192.168.0.105:8080/testenginedemo/login';
    Map<String, String> data = {"userid": t1, "password": t2};
    var data2 = jsonEncode(data);
    print('data is $data2');
    var response = await http.post(
        'http://393082472247.ngrok.io/testenginedemo/login',
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: data2);
    var jsonData = json.decode(response.body);
    if (response.statusCode == 200) {
      print('${response.statusCode}');
      var jsonData = json.decode(response.body);
//      User user = new User.fromJson(jsonData);
//      print('${user.rights[4].viewQuestion}');
//      print(person.roleName);
//      print(person.rights);
//      print('Rights are${person.rights[5]}');
//      print(jsonData.runtimeType);
//      print(jsonData['message']);
//      print(jsonData['rights'][3]['name']);
      // print('JsonData is $jsonData');
    }
    return User.fromJson(jsonData);
  }
}
