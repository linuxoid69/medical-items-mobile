library screens;

import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('База медикаментов'),
      ),
      body: Container(
        child: Table(
          children: [
            TableRow(
              children: [
              RaisedButton(
                child: Text('Сканировать товар.'),
                onPressed: () {
                  // Navigate to the second screen when tapped.
                  Navigator.pushNamed(context, '/scan_barcode');
                },
              ),
              RaisedButton(
                child: Text('Список лекарств в базе.'),
                onPressed: () {
                  // Navigate to the second screen when tapped.
                  Navigator.pushNamed(context, '/drugs_list');
                },
              ),
            ])
          ],
        ),
      ),
    );
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
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first screen when tapped.
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go to thee!'),
        ),
      ),
    );
  }
}
