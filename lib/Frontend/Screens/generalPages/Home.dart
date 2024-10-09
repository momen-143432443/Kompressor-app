import 'package:ecar/Frontend/widgets.dart';
import 'package:ecar/tools/colorsTool.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: controller.homeFormKey,
        body: SafeArea(
            child: RefreshIndicator(
          edgeOffset: 10,
          backgroundColor: blueColor,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          color: white,
          onRefresh: () async => refreshBloc,
          child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: homeFunctions()),
          ),
        )),
        floatingActionButton: homeFloatingActionButton);
  }
}
