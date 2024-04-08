// Import necessary packages for defining custom animations and detecting widget visibility.
import 'package:animate_ease/components/animation_type.dart';
import 'package:flutter/widgets.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// The VisibilityDetect class provides a static method to dynamically handle the visibility of widgets
/// and apply animations based on the AnimationType specified. It utilizes the VisibilityDetector package
/// to trigger animations when widgets become visible on the screen.
class VisibilityDetect {
  /// The visib static method creates a VisibilityDetector that listens for visibility changes of the widget
  /// and applies animations accordingly.
  ///
  /// - Parameters:
  ///   - widget: The widget to which the visibility detection and animation should be applied.
  ///   - animation: The animation that will be applied to the widget. This should be a reference to an Animation<double> object.
  ///   - controller: The AnimationController that controls the animation.
  ///   - completedCycles: The number of completed animation cycles.
  ///   - animationType: The type of animation to apply, as defined in AnimationType.
  ///
  /// - Returns: A VisibilityDetector widget that wraps the input widget and applies the specified animation when the widget becomes visible.
  static visib(
    dynamic widget,
    Animation<double>? animation,
    AnimationController? controller,
    int completedCycles,
    AnimationType? animationType,
  ) {
    return VisibilityDetector(
      key: Key('AnimateEase_${widget.animate.toString()}'), // Unique key for the detector based on the animation type.
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100; // Calculate the percentage of the widget that is visible.
        if (visiblePercentage > 0) { // If any part of the widget is visible,
          if (!controller.isAnimating && // and the animation is not currently running,
              (controller.status != AnimationStatus.completed || // and the animation hasn't completed or needs to repeat,
                  widget.atRestAnimate)) {
            // If animationCount is not set or completedCycles is less than the animationCount, start the animation.
            if (widget.animationCount == null || completedCycles < widget.animationCount!) {
              Future.delayed(widget.delay, () => controller.forward(from: 0.0)); // Start the animation after the specified delay.
            }
          }
        }
      },
      child: AnimatedBuilder(
        animation: controller!, // The animation controller that drives the animation.
        builder: (context, child) {
          switch (animationType) { // Switch on the type of animation to apply different transformations.
            case AnimationType.fadeIn:
              return Opacity(
                opacity: animation!.value,
                child: widget.child,
              );

            case AnimationType.fadeOut:
              return Opacity(
                opacity: animation!.value,
                child: widget.child,
              );
            case AnimationType.rotate:
              return Transform.rotate(
                angle: animation!.value * 2 * 3.141592653589793,
                child: widget.child,
              );
            case AnimationType.scaleUp:
              return Transform.scale(
                scale: 1.0 - animation!.value,
                child: widget.child,
              );
            case AnimationType.scaleDown:
              return Transform.scale(
                scale: animation!.value,
                child: widget.child,
              );
            case AnimationType.slideInRight:
              return Transform.translate(
                offset: Offset(
                    animation!.value * MediaQuery.of(context).size.width, 0.0),
                child: widget.child,
              );

            case AnimationType.slideOutLeft:
              return Transform.translate(
                offset: Offset(
                    -animation!.value * MediaQuery.of(context).size.width, 0.0),
                child: widget.child,
              );

            case AnimationType.slideInBottom:
              return Transform.translate(
                offset: Offset(
                    0.0, animation!.value * MediaQuery.of(context).size.height),
                child: widget.child,
              );
            case AnimationType.slideOutTop:
              return Transform.translate(
                offset: Offset(0.0,
                    -animation!.value * MediaQuery.of(context).size.height),
                child: widget.child,
              );
            case AnimationType.slideInTop:
              return Transform.translate(
                offset: Offset(
                    0.0, animation!.value * MediaQuery.of(context).size.height),
                child: widget.child,
              );
            case AnimationType.slideOutRight:
              return Transform.translate(
                offset: Offset(
                    animation!.value * MediaQuery.of(context).size.width, 0.0),
                child: widget.child,
              );
            case AnimationType.slideInLeft:
              return Transform.translate(
                offset: Offset(
                    -animation!.value * MediaQuery.of(context).size.width, 0.0),
                child: widget.child,
              );

            case AnimationType.slideOutBottom:
              return Transform.translate(
                offset: Offset(0.0,
                    -animation!.value * MediaQuery.of(context).size.height),
                child: widget.child,
              );
            case AnimationType.rotateIn:
              return Transform.rotate(
                angle: animation!.value * (3.141592653589793 / 2),
                child: widget.child,
              );
            case AnimationType.rotateOut:
              return Transform.rotate(
                angle: -animation!.value * (3.141592653589793 / 2),
                child: widget.child,
              );
            case AnimationType.opacityInLeft:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(
                      -(animation.value * MediaQuery.of(context).size.width),
                      0.0),
                  child: widget.child,
                ),
              );
            case AnimationType.opacityInRight:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(
                      animation.value * MediaQuery.of(context).size.width, 0.0),
                  child: widget.child,
                ),
              );
            case AnimationType.opacityInUp:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(0.0,
                      -(animation.value * MediaQuery.of(context).size.height)),
                  child: widget.child,
                ),
              );
            case AnimationType.opacityInDown:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(0.0,
                      animation.value * MediaQuery.of(context).size.height),
                  child: widget.child,
                ),
              );
            case AnimationType.translateInLeft:
              return Transform.translate(
                offset: Offset(
                    -(animation!.value * MediaQuery.of(context).size.width),
                    0.0),
                child: widget.child,
              );
            case AnimationType.translateInRight:
              return Transform.translate(
                offset: Offset(
                    animation!.value * MediaQuery.of(context).size.width, 0.0),
                child: widget.child,
              );
            case AnimationType.translateInUp:
              return Transform.translate(
                offset: Offset(0.0,
                    -(animation!.value * MediaQuery.of(context).size.height)),
                child: widget.child,
              );
            case AnimationType.translateInDown:
              return Transform.translate(
                offset: Offset(
                  animationType == AnimationType.translateInLeft ||
                          animationType == AnimationType.translateInRight
                      ? animation!.value * MediaQuery.of(context).size.width
                      : 0.0,
                  animationType == AnimationType.translateInUp ||
                          animationType == AnimationType.translateInDown
                      ? animation!.value * MediaQuery.of(context).size.height
                      : 0.0,
                ),
                child: widget.child,
              );
            case AnimationType.scatteredIn:
              return Transform(
                transform: Matrix4.diagonal3Values(
                    animation!.value, animation.value, 1.0),
                child: widget.child,
              );
            case AnimationType.particles:
              return Transform(
                transform: Matrix4.translationValues(
                    animation!.value * 10, animation.value * 10, 0.0),
                child: widget.child,
              );
            case AnimationType.rainFall:
              return Transform.translate(
                offset: Offset(
                    0.0, animation!.value * MediaQuery.of(context).size.height),
                child: widget.child,
              );
            case AnimationType.rollInLeft:
              return Transform.rotate(
                angle: animation!.value * (3.141592653589793 / 2),
                child: Transform.translate(
                  offset: Offset(
                      -(animation.value * MediaQuery.of(context).size.width),
                      0.0),
                  child: widget.child,
                ),
              );
            case AnimationType.rollInRight:
              return Transform.rotate(
                angle: animation!.value * (-3.141592653589793 / 2),
                child: Transform.translate(
                  offset: Offset(
                      animation.value * MediaQuery.of(context).size.width, 0.0),
                  child: widget.child,
                ),
              );
            case AnimationType.rollInUp:
              return Transform.rotate(
                angle: animation!.value * (-3.141592653589793 / 2),
                child: Transform.translate(
                  offset: Offset(0.0,
                      -(animation.value * MediaQuery.of(context).size.height)),
                  child: widget.child,
                ),
              );
            case AnimationType.rollInDown:
              return Transform.rotate(
                angle: animation!.value * (3.141592653589793 / 2),
                child: Transform.translate(
                  offset: Offset(0.0,
                      animation.value * MediaQuery.of(context).size.height),
                  child: widget.child,
                ),
              );
            case AnimationType.bounceIn:
              return Transform.scale(
                scale: 1 - animation!.value.abs(),
                child: widget.child,
              );

            case AnimationType.bounceOut:
              return Transform.scale(
                scale: animation!.value,
                child: widget.child,
              );

            case AnimationType.elasticIn:
              return Transform.scale(
                scale: 1 - animation!.value,
                child: widget.child,
              );

            case AnimationType.elasticOut:
              return Transform.scale(
                scale: animation!.value,
                child: widget.child,
              );

            case AnimationType.jitter:
              return Transform(
                transform: Matrix4.translationValues(
                  animation!.value * 5,
                  animation.value * 5,
                  0.0,
                ),
                child: widget.child,
              );

            case AnimationType.wiggle:
              return Transform(
                transform: Matrix4.rotationZ(
                  animation!.value * 0.1,
                ),
                child: widget.child,
              );

            case AnimationType.pulse:
              return Transform.scale(
                scale: 1 - (animation!.value * 0.2),
                child: widget.child,
              );

            case AnimationType.expand:
              return Transform.scale(
                scale: animation!.value,
                child: widget.child,
              );

            case AnimationType.collapse:
              return Transform.scale(
                scale: 1 - animation!.value,
                child: widget.child,
              );

            case AnimationType.shake:
              return Transform(
                transform: Matrix4.translationValues(
                  animation!.value * 10,
                  0.0,
                  0.0,
                ),
                child: widget.child,
              );

            case AnimationType.swing:
              return Transform.rotate(
                angle: animation!.value * 0.2,
                child: widget.child,
              );

            case AnimationType.tada:
              return Transform.scale(
                scale: 1 + animation!.value * 0.1,
                child: widget.child,
              );

            case AnimationType.wobble:
              return Transform(
                transform: Matrix4.rotationZ(
                  animation!.value * 0.2,
                ),
                child: widget.child,
              );

            case AnimationType.jello:
              return Transform(
                transform: Matrix4.skewX(
                  animation!.value * 0.2,
                ),
                child: widget.child,
              );

            case AnimationType.heartBeat:
              return Transform.scale(
                scale: 1 - animation!.value.abs() * 0.2,
                child: widget.child,
              );

            case AnimationType.flash:
              return Opacity(
                opacity: animation!.value < 0.5 ? 1.0 : 0.0,
                child: widget.child,
              );

            case AnimationType.rubberBand:
              return Transform.scale(
                scale: 1 - animation!.value.abs() * 0.3,
                child: widget.child,
              );

            case AnimationType.headShake:
              return Transform.rotate(
                angle: animation!.value * 0.2,
                child: widget.child,
              );

            case AnimationType.squeeze:
              return Transform.scale(
                scale: animation!.value < 0.5
                    ? 1 - animation.value
                    : animation.value,
                child: widget.child,
              );
            case AnimationType.flipX:
              return Transform(
                transform: Matrix4.rotationY(
                  animation!.value * 3.141592653589793,
                ),
                alignment: Alignment.center,
                child: widget.child,
              );

            case AnimationType.flipY:
              return Transform(
                transform: Matrix4.rotationX(
                  animation!.value * 3.141592653589793,
                ),
                alignment: Alignment.center,
                child: widget.child,
              );

            case AnimationType.zoomIn:
              return Transform.scale(
                scale: animation!.value,
                child: widget.child,
              );

            case AnimationType.zoomOut:
              return Transform.scale(
                scale: 1 - animation!.value,
                child: widget.child,
              );

            case AnimationType.slideInLeftFade:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(
                    -animation.value * MediaQuery.of(context).size.width,
                    0.0,
                  ),
                  child: widget.child,
                ),
              );

            case AnimationType.slideInRightFade:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(
                    animation.value * MediaQuery.of(context).size.width,
                    0.0,
                  ),
                  child: widget.child,
                ),
              );

            case AnimationType.slideInTopFade:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(
                    0.0,
                    -animation.value * MediaQuery.of(context).size.height,
                  ),
                  child: widget.child,
                ),
              );

            case AnimationType.slideInBottomFade:
              return Opacity(
                opacity: animation!.value,
                child: Transform.translate(
                  offset: Offset(
                    0.0,
                    animation.value * MediaQuery.of(context).size.height,
                  ),
                  child: widget.child,
                ),
              );

            default:
              return widget.child;
          }
        },
      ),
    );
  }
}
