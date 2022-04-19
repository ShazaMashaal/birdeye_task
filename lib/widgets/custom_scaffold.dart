import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;

  final int? itemCount;

  final Widget Function(BuildContext, int)? itemBuilder;
  const CustomScaffold({Key? key, this.title, this.itemCount, this.itemBuilder})
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
        children: [
          Expanded(
            child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemBuilder: itemBuilder!,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                      height: 12,
                    ),
                itemCount: itemCount!),
          )
        ],
      )),
    );
  }
}
