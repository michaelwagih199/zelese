import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zelese/theme/appStyleConfig.dart';

class TestJson extends StatefulWidget {
  @override
  _TestJsonState createState() => _TestJsonState();
}

class _TestJsonState extends State<TestJson> {
  List _items = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/data/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyleConfig.appColors['backgrounLight'],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Kindacode.com',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: Text('Load Data'),
              onPressed: readJson,
            ),

            // Display the data loaded from sample.json
            _items.length > 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                            leading: Text(_items[index]["id"]),
                            title: Text(_items[index]["name"]),
                            subtitle: Text(_items[index]["description"]),
                          ),
                        );
                      },
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
