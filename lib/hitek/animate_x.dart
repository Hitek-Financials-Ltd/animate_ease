// Import necessary packages and files for the animation functionality.
import 'package:animate_ease/hitek/animation_type.dart';
import 'package:flutter/material.dart';

/// The AnimateX class provides a static method to setup animations based on different types.
/// It supports a wide range of animations such as fading, sliding, scaling, rotating, and more.
class AnimateX{

  /// The setup method initializes the animation based on the provided `animationType`.
  /// It requires an `Animation<double>?` to update, an `AnimationController?` to control the animation, 
  /// and an `AnimationType?` which defines the type of animation to be applied.
  static void setup(
    Animation<double>? animation,
    AnimationController? controller,
    AnimationType? animationType,
  ) {
    // Use a switch statement to determine the animation type and configure the animation accordingly.
    switch (animationType) {
      // Each case below configures the animation variable based on the specified `AnimationType`.
      // It uses the `Tween` class to define the animation's start and end points, and `CurvedAnimation`
      // to apply easing and other timing functions.
      case AnimationType.fadeIn:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeOut:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInLeft:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideOutLeft:
        animation = Tween<double>(begin: 0.0, end: -1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInRight:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideOutRight:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInTop:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideOutTop:
        animation = Tween<double>(begin: 0.0, end: -1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInBottom:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideOutBottom:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.scaleUp:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        break;
      case AnimationType.scaleDown:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        break;
      case AnimationType.rotate:
        animation = Tween<double>(begin: 0.0, end: 2 * 3.141592653589793)
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.flipX:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.flipY:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.zoomIn:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.zoomOut:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;

      case AnimationType.bounceIn:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.bounceOut));
        break;
      case AnimationType.bounceOut:
        animation = Tween<double>(begin: 0.0, end: -1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.bounceOut));
        break;
      case AnimationType.elasticIn:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        break;
      case AnimationType.elasticOut:
        animation = Tween<double>(begin: 0.0, end: -1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.elasticOut));
        break;
      case AnimationType.jitter:
        animation = Tween<double>(begin: -1.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.wiggle:
        animation = Tween<double>(begin: -0.1, end: 0.1).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.pulse:
        animation = Tween<double>(begin: 1.0, end: 0.8).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.expand:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.collapse:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.shake:
        animation = Tween<double>(begin: -10.0, end: 10.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.swing:
        animation = Tween<double>(begin: -0.1, end: 0.1).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.tada:
        animation = Tween<double>(begin: -0.1, end: 0.1).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.wobble:
        animation = Tween<double>(begin: -0.3, end: 0.3).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.jello:
        animation = Tween<double>(begin: -0.1, end: 0.1).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.heartBeat:
        animation = Tween<double>(begin: -0.2, end: 0.2).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.flash:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.rubberBand:
        animation = Tween<double>(begin: -0.3, end: 0.3).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.headShake:
        animation = Tween<double>(begin: -0.1, end: 0.1).animate(
            CurvedAnimation(parent: controller!, curve: Curves.linear));
        break;
      case AnimationType.squeeze:
        animation = Tween<double>(begin: -1.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeInLeft:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeInRight:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeInUp:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeInDown:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeOutLeft:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeOutRight:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeOutUp:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.fadeOutDown:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInLeftFade:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInRightFade:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInTopFade:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.slideInBottomFade:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.rotateIn:
        animation = Tween<double>(begin: 0.0, end: 2 * 3.141592653589793)
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.rotateOut:
        animation = Tween<double>(begin: 2 * 3.141592653589793, end: 0.0)
            .animate(
                CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.opacityInLeft:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.opacityInRight:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.opacityInUp:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.opacityInDown:
        animation = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.translateInLeft:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.translateInRight:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.translateInUp:
        animation = Tween<double>(begin: -1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      case AnimationType.translateInDown:
        animation = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(parent: controller!, curve: Curves.easeInOut));
        break;
      default:
        animation = Tween<double>(begin: 1.0, end: 1.0).animate(controller!);
    }
  }
}