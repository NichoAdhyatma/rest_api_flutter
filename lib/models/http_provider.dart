import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  int get jumlah => _data.length;
  late Uri url;

  void fetchApi(String id, BuildContext context) async {
    url = Uri.parse("https://reqres.in/api/users/$id");

    await http.get(url).then(
      (response) {
        _data = (json.decode(response.body) as Map<String, dynamic>)["data"];
        notifyListeners();
        messageAlert(context, "Berhasil GET data ${response.statusCode}");
      },
    ).catchError((error) {
      messageAlert(context, "Gagal GET data");
    });
  }

  void delete(BuildContext context) async {
    await http.delete(url).then((response) {
      _data = {};
      notifyListeners();
      messageAlert(context, "Data berhasil dihapus ${response.statusCode}");
    });
  }

  void messageAlert(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 1),
      ),
    );
  }
}
