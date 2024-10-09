import 'package:flutter/material.dart';

class HereLocationScreen extends StatefulWidget {
  const HereLocationScreen({super.key});

  @override
  State<HereLocationScreen> createState() => _HereLocationScreenState();
}

class _HereLocationScreenState extends State<HereLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello Page"),
      ),
    );
  }
}