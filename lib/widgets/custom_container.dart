import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double padding;
  const CustomContainer({Key? key, this.child, this.padding=20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [BoxShadow(offset: const Offset(2,2),blurRadius: 6,color: Colors.grey[400]!)]
      ),
      child: child,
    );
  }
}
