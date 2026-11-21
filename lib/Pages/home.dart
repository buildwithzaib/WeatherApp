// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> getData() async {
    final Response response = await get(
      Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=34.12&longitude=72.47&current_weather=true",
      ),
    );
    debugPrint("HTTP status: ${response.statusCode}");
    Map data = jsonDecode(response.body);
    print(data['current_weather']);
  }

  int counter = 1;
  @override
  void initState() {
    super.initState();

    print("this is a init state");
    getData();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget desposed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen"), backgroundColor: Colors.blue),
      body: Column(
        children: [
          FloatingActionButton(
            onPressed: () => setState(() {
              counter += 1;
            }),
          ),
          Text("$counter"),
        ],
      ),
    );
  }
}
