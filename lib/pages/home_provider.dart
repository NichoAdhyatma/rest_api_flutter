import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_flutter/models/http_provider.dart';

class HomeProvider extends StatelessWidget {
  const HomeProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<HttpProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("GET - PROVIDER"),
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
                child: Consumer<HttpProvider>(
                  builder: (context, value, child) => Image.network(
                    value.data["avatar"] ??
                        "https://www.uclg-planning.org/sites/default/files/styles/featured_home_left/public/no-user-image-square.jpg?itok=PANMBJF-",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  "ID : ${value.data["id"] ?? "Belum ada data"}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  value.data["first_name"] != null &&
                          value.data["last_name"] != null
                      ? value.data["first_name"] + " " + value.data["last_name"]
                      : "Belum ada data",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
              child: Text(
                "Email : ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  value.data["email"] ?? "Belum ada data",
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                data.fetchApi((1 + Random().nextInt(13)).toString(), context);
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          data.delete(context);
        },
        child: const Icon(Icons.delete),
      ),
    );
  }
}
