library screens;

import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var allCodes = [];
  var monVal = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: new Text('База медикаментов'),
        ),
        body: new Container(
            color: Colors.green[100],
            child: ListView(
              children: <Widget>[
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Table(
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: [
                              new TableRow(children: [
                                new RaisedButton(
                                  child: new Text('Сканировать товар.'),
                                  onPressed: scan,
                                ),
                                new RaisedButton(
                                  child: new Text('Список лекарств в базе.'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/drugs_list');
                                  },
                                ),
                              ]),
                              new TableRow(children: [
                                new RaisedButton(
                                  child: new Text('Очистить список.'),
                                  onPressed: clearListDrugs,
                                ),
                                new RaisedButton(
                                  child: new Text('Отправить данные.'),
                                  onPressed: () {},
                                ),
                              ]),
                            ]),
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        new Table(children: [
                          new TableRow(children: [
                            Text(
                              "Код товара",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Количество",
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Дом/Дача",
                              textAlign: TextAlign.center,
                            )
                          ]),
                        ]),
                      ],
                    ),
                    new Table(
                      children: [
                        for (var i in allCodes)
                          TableRow(children: [
                            Text(
                              (allCodes.indexOf(i.toString()) + 1).toString() +
                                  ") " +
                                  i,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '',
                              textAlign: TextAlign.center,
                            ),
                            Checkbox(
                              //                  key: Key(i.toString()),
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
                  ],
                )
              ],
            )));
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

  void clearListDrugs() {
    setState(() {
      allCodes = [];
    });
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
