import 'package:flutter/material.dart';
import 'package:rest_api_flutter/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  const HomeStateful({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
  HttpStateful data = HttpStateful();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("POST - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                data.id.isNotEmpty ? "ID : ${data.id}" : "ID : Belum ada data",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                data.name.isNotEmpty ? data.name : "Belum ada data",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Job : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                data.job.isNotEmpty ? data.job : "Belum ada data",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(
                child: Text("Created At : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                data.createdAt.isNotEmpty ? data.createdAt : "Belum ada data",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                HttpStateful.connectAPI("Nicho", "Developer").then(
                  (value) => setState(
                    () {
                      data = value;
                    },
                  ),
                );
              },
              child: const Text(
                "POST DATA",
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
