import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlah => _data.length;

  void fetchApi(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");

    var response = await http.get(url);

    _data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    notifyListeners();
  }
}
