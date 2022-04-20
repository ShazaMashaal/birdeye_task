import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget? child;
  final int? itemCount;

  final Widget Function(BuildContext, int)? itemBuilder;
  const CustomScaffold(
      {Key? key, this.title, this.itemCount, this.itemBuilder, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(title!),
      ),
      body: SafeArea(
          child: Column(
        children: [Expanded(child: child!)],
      )),
    );
  }
}
