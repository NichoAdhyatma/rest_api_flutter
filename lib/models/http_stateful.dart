import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String id, fullname, email, avatar;

  HttpStateful({
    this.id = "",
    this.fullname = "",
    this.email = "",
    this.avatar = "",
  });

  static Future<HttpStateful> fetchApi(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/$id");

    var response = await http.get(url);

    var data = (json.decode(response.body) as Map<String, dynamic>)["data"];
    return HttpStateful(
      id: data["id"].toString(),
      fullname: data["first_name"] + " " + data["last_name"],
      email: data["email"],
      avatar: data["avatar"],
    );
  }
}
