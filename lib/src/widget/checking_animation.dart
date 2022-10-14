import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

///
/// @desc 检测更新的动画
/// @author weixiaoqiang
/// @date 2022/5/31 14:47
///
class CheckingAnimation extends StatefulWidget {
  const CheckingAnimation({Key? key}) : super(key: key);

  @override
  State<CheckingAnimation> createState() => _CheckingAnimationState();
}

class _CheckingAnimationState extends State<CheckingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: SvgPicture.asset(
        'assets/svg/check_loading_dialog.svg',
        width: 48.w,
        height: 48.w,
      ),
    );
  }
}
