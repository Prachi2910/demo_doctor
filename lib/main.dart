import 'package:demo_doctor/constant/dimens.constants.dart';
import 'package:demo_doctor/ui/dashboard/screen/dashboard.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashBoardScreen(),
      builder: (_, child) => _ContentBuilder(child: child ?? Container()),
    );
  }
}

class _ContentBuilder extends StatelessWidget {
  const _ContentBuilder({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(kSpaceZero), child: child);
  }
}
