import 'package:actividad2562372014/paginas/principal.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(actividad());
}

class actividad extends StatelessWidget {
  const actividad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Principal(),
    );
  }
}
