import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:window_manager/window_manager.dart';

import '../../env/env.dart';

class CleverIsland extends StatefulWidget {
  const CleverIsland({Key? key}) : super(key: key);

  @override
  State<CleverIsland> createState() => _CleverIslandState();
}

class _CleverIslandState extends State<CleverIsland>
    with TickerProviderStateMixin {
  int count = 0;

  late Animation<Size> _animation;
  late AnimationController _animationController;
  AnimationStatus status = AnimationStatus.forward;

  late Animation<double> _scaleAnimation;
  late AnimationController _scaleAnimationController;

  late Animation<double> _ballAnimation;
  late AnimationController _ballAnimationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<Size>(
      begin: Size(104.w, EnvConfig.relHeight),
      end: Size(168.w, EnvConfig.relHeight),
    ).animate(_animationController);

    _scaleAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(_scaleAnimationController);

    _ballAnimationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _ballAnimation = Tween<double>(begin: 0, end: -EnvConfig.relHeight - 5)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_ballAnimationController);

    _animationController.addListener(() {
      if (count == 2 &&
          status == AnimationStatus.reverse &&
          _animationController.value > 0.25 &&
          _animationController.value < 0.3) {
        _ballAnimationController.forward(from: 0);
      }
    });

    _animationController.addStatusListener((status) {
      this.status = status;
      if (status == AnimationStatus.completed) {
        _scaleAnimation = Tween<double>(
          begin: count == 3 ? 1.04 : 1.06,
          end: 1,
        ).animate(_scaleAnimationController);
        _scaleAnimationController.forward(from: 0);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (count == 0) {
          _animation = Tween<Size>(
            begin: Size(104.w, EnvConfig.relHeight),
            end: Size(168.w, EnvConfig.relHeight),
          ).animate(_animationController);
          _animationController.forward(from: 0);
        } else if (count == 1) {
          _animationController.reverse();
        } else if (count == 2) {
          _ballAnimationController.reverse();
        }
        // else if (count == 3) {
        //   _animationController.reverse();
        // }
        if (count == 2) {
          count = 0;
        } else {
          count++;
        }
      },
      onPanStart: (e) {
        windowManager.startDragging();
      },
      child: AnimatedBuilder(
        animation: _ballAnimation,
        builder: (context, _) => Stack(clipBehavior: Clip.none, children: [
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, _) => AnimatedBuilder(
              animation: _animation,
              builder: (context, _) => Container(
                width: _animation.value.width * _scaleAnimation.value,
                height: _animation.value.height * _scaleAnimation.value,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.h),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: _ballAnimation.value,
            child: Container(
              width: EnvConfig.relHeight,
              height: EnvConfig.relHeight,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
