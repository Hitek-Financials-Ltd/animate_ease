// This file defines the AnimateEase library which provides widget animation capabilities in Flutter apps.

library animate_ease;

// Import statements to include Flutter material design widgets and custom components for animation.
import 'package:animate_ease/components/animate_x.dart';
import 'package:animate_ease/components/animation_type.dart';
import 'package:animate_ease/components/visibility_detect.dart';
import 'package:flutter/material.dart';

/// The AnimateEase StatefulWidget allows for easy implementation of animations with various configurations.
class AnimateEase extends StatefulWidget {
  // Properties of the AnimateEase widget to customize the animation.
  final Widget child; // The child widget to be animated.
  final AnimationType animate; // The type of animation to apply.
  final Duration duration; // Duration of the animation.
  final Duration delay; // Delay before the animation starts.
  final bool atRestAnimate; // Determines if the animation should play at rest.
  final int? animationCount; // Nullable integer specifying the number of animation cycles.

  // Constructor for AnimateEase with required and optional parameters, setting default values for optional ones.
  /// usage 
  /// - AnimateEase(child: any widget)
  const AnimateEase({
    super.key,
    required this.child,
    this.animate = AnimationType.fadeIn, // Default animation type is fadeIn.
    this.duration = const Duration(seconds: 1), // Default duration of 1 second.
    this.delay = const Duration(seconds: 0), // Default delay of 0 seconds.
    this.atRestAnimate = true, // Default behavior to animate at rest.
    this.animationCount, // Nullable, so it's optional and can be null.
  });

  @override
  State<AnimateEase> createState() => _AnimateEaseState();
}

/// Private State class _AnimateEaseState handles the animation logic for AnimateEase widget.
class _AnimateEaseState extends State<AnimateEase>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  AnimationController? _controller; // Manages the animation.
  Animation<double>? _animation; // The animation to be played.
  int _animationCycleCount = 0; // Tracks the number of completed animation cycles.
  late AnimationType _animationType; // Stores the type of animation to play.
  final int _completedCycles = 0; // Counts the completed cycles, currently unused.
  
  @override
  void initState() {
    super.initState();
    _animationType = widget.animate; // Initialize animation type from widget properties.
    WidgetsBinding.instance.addObserver(this); // Add this class as an observer to lifecycle events.

    // Initialize the animation controller with the duration and vsync provider.
    _controller = AnimationController(duration: widget.duration, vsync: this)
      ..addStatusListener((status) {
        // Listen to the animation status to manage animation cycles.
        if (status == AnimationStatus.completed) {
          // Logic to handle repeat or reverse animation based on widget properties and cycle count.
          if (!widget.atRestAnimate &&
              (widget.animationCount == null ||
                  _animationCycleCount < widget.animationCount! - 1)) {
            _controller!.forward(from: 0.0);
          } else if (widget.atRestAnimate &&
              widget.animationCount != null &&
              _animationCycleCount < widget.animationCount!) {
            _controller!.reverse(from: 1.0);
          }
          _animationCycleCount++;
        } else if (status == AnimationStatus.dismissed) {
          if (widget.atRestAnimate &&
              (widget.animationCount == null ||
                  _animationCycleCount < widget.animationCount!)) {
            _controller!.forward();
          }
        }
      });

    // Call setup to initialize the animation based on the type and controller.
    AnimateX.setup(_animation, _controller, _animationType);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Lifecycle method to resume animation when the app comes to the foreground.
    if (state == AppLifecycleState.resumed) {
      _controller?.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Builds the widget tree, incorporating visibility detection and animation.
    return VisibilityDetect.visib(
      widget, 
      _animation, 
      _controller, 
      _completedCycles, 
      _animationType,
    );
  }

  @override
  void dispose() {
    // Dispose of the animation controller and remove the lifecycle observer on widget disposal.
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
