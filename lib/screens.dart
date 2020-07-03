library screens;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var allCodes = [];
  var monVal = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('База медикаментов'),
      ),
      body: Container(
        color: Colors.green[100],
        child: Table(
          children: [
            TableRow(children: [
              RaisedButton(
                child: Text('Сканировать товар.'),
                onPressed: scan,
              ),
              RaisedButton(
                child: Text('Список лекарств в базе.'),
                onPressed: () {
                  Navigator.pushNamed(context, '/drugs_list');
                },
              ),
            ]),
            for (var i in allCodes)
              TableRow(children: [
                Text(i),
                Checkbox(
                  key: Key(i.toString()),
                  value: monVal,
                  onChanged: (bool value) {
                    setState(() {
                      monVal = value;
                    });
                  },
                )
              ])
          ],
        ),
      ),
    );
  }

  Future scan() async {
    var options = ScanOptions(
      android: AndroidOptions(
        useAutoFocus: true,
      ),
    );

    var result = await BarcodeScanner.scan(options: options);

    if (result.type.toString() != "Cancelled") {
      allCodes.add(result.rawContent);
    }
    setState(() {});
    return allCodes;
  }
}


class DrugListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Список лекарств"),
      ),
      body: Container(
        child: RaisedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go to thee!'),
        ),
      ),
    );
  }
}
