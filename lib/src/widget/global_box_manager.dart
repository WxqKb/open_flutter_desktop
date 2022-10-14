import 'dart:io';

import 'package:flutter/material.dart';

class GlobalBoxManager extends StatelessWidget {
  const GlobalBoxManager({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      // android伪全屏，加入边距
      padding: Platform.isAndroid
          ? const EdgeInsets.symmetric(horizontal: 168, vertical: 88)
          : EdgeInsets.zero,
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            boxShadow: [
              BoxShadow(color: Color(0x33000000), blurRadius: 8),
            ]),
        child: child,
      ),
    );
  }
}
