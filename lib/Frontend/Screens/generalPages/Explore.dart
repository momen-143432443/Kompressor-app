import 'package:ecar/Frontend/widgets.dart';
import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [ads, services, payment],
        ),
      )),
    );
  }
}
