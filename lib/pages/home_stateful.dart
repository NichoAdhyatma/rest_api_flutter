// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful data = HttpStateful();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  data.avatar.isNotEmpty
                      ? data.avatar
                      : "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Text(
                "ID : ${data.id.isNotEmpty ? data.id : "Belum ada data"}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                data.fullname.isNotEmpty ? data.fullname : "Belum ada data",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                data.email.isNotEmpty ? data.email : "Belum ada data",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateful.fetchApi((1 + Random().nextInt(13)).toString())
                    .then(
                  (value) => setState(
                    () => data = value,
                  ),
                );
              },
              child: const Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
