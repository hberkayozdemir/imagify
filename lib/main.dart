import 'package:flutter/material.dart';
import 'package:imagify/app/features/lander/lander.dart';

void main() {
  runApp(const Imagify());
}

class Imagify extends StatefulWidget {
  const Imagify({super.key});

  @override
  State<Imagify> createState() => _ImagifyState();
}

class _ImagifyState extends State<Imagify> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Lander());
  }
}
