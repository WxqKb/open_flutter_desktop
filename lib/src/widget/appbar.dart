import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

PreferredSizeWidget globalAppBar(BuildContext context,
    {String? title,
    bool needLeading = true,
    List<Widget> actions = const [],
    SystemUiOverlayStyle? systemOverlayStyle,
    double height = 64}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanStart: (details) {
        if (Platform.isWindows) windowManager.startDragging();
      },
      onDoubleTap: () {},
      child: AppBar(
        primary: false,
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: height,
        centerTitle: true,
        elevation: 0.2,
        leadingWidth: 96,
        leading: needLeading
            ? Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Icon(Icons.arrow_back_ios_outlined, size: 24),
                  ),
                ),
              )
            : null,
        title: Text(
          title ?? '',
          style: Theme.of(context)
              .textTheme
              .headline2
              ?.copyWith(fontSize: 21, height: 1),
        ),
        actions: [
          ...actions,
          GestureDetector(
            onTap: () {
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Icon(
                Icons.close,
                size: 24.w,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
