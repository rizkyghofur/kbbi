import 'package:flutter/material.dart';
import 'package:kbbi/pages/Beranda.dart';
import 'package:kbbi/utils/Injector.dart';

void main() async {
  await baseDio();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kamus Besar Bahasa Indonesia',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Beranda(),
      debugShowCheckedModeBanner: false,
    );
  }
}
