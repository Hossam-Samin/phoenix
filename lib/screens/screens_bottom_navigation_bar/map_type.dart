import 'package:flutter/material.dart';
class MapTypeScreen extends StatefulWidget {
  const MapTypeScreen({super.key});

  @override
  State<MapTypeScreen> createState() => _MapTypeScreenState();
}

class _MapTypeScreenState extends State<MapTypeScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     body: Center(child: Text("Hello Page"),),
    );
  }
}