import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Parth ka Pehla App',
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
        ),
      ),
    );
  }
}
