import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlah => _data.length;

  void connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    await http.post(
      url,
      body: {
        "name": name,
        "job": job,
      },
    ).then(
      (value) => _data = (json.decode(value.body))["data"],
    );

    notifyListeners();
  }
}
