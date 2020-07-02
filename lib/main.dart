import "package:flutter/material.dart";
import "screens.dart";

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => MainScreen(),
      '/drugs_list': (context) => DrugListScreen(),
    },
  ));
}
