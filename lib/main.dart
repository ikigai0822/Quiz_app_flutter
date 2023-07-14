import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  Color maincolor = const Color(0xFF071D36);
  Color secondcolor = const Color(0xFF0D121F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
    );
  }
}