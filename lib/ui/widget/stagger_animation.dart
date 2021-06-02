/*
   DEVELOPED BY: KAMLESH LAKHANI
   FOR BUTTON PRESS ANIMATION
*/
import 'package:ecommerce/resource/style/app_text_style.dart';
import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  final VoidCallback? onTap;
  final String titleButton;

  StaggerAnimation({
    Key? key,
    required this.buttonController,
    this.onTap,
    this.titleButton = 'Sign In',
  })  : buttonSqueezeAnimation = Tween(begin: 320.0, end: 50.0).animate(
            CurvedAnimation(
                parent: buttonController, curve: const Interval(0.0, 0.150))),
        containerCircleAnimation = EdgeInsetsTween(
          begin: const EdgeInsets.only(bottom: 30.0),
          end: const EdgeInsets.only(bottom: 0.0),
        ).animate(CurvedAnimation(
            parent: buttonController,
            curve: const Interval(0.500, 0.800, curve: Curves.ease))),
        super(key: key);

  final AnimationController buttonController;
  final Animation<EdgeInsets> containerCircleAnimation;
  final Animation buttonSqueezeAnimation;

  Widget _buildAnimation(BuildContext context, Widget? child) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            width: buttonSqueezeAnimation.value,
            height: 45,
            alignment: FractionalOffset.center,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(25.0))),
            child: buttonSqueezeAnimation.value > 75.0
                ? Text(titleButton,
                    style: AppTextStyle.buttonTextStyle)
                : const CircularProgressIndicator(
                    value: null,
                    strokeWidth: 1.0,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white))));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        builder: _buildAnimation, animation: buttonController);
  }
}
