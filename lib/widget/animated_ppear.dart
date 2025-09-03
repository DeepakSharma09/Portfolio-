import 'dart:async';
import 'package:flutter/material.dart';

class AnimatedAppear extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Offset offset;
  final Duration duration;

  const AnimatedAppear({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 0),
    this.offset = const Offset(0, 16),
    this.duration = const Duration(milliseconds: 600),
  });

  @override
  State<AnimatedAppear> createState() => _AnimatedAppearState();
}

class _AnimatedAppearState extends State<AnimatedAppear>
    with SingleTickerProviderStateMixin {
  late AnimationController _c;
  late Animation<double> _opacity;
  late Animation<Offset> _shift;

  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: widget.duration);
    _opacity = CurvedAnimation(parent: _c, curve: Curves.easeOutCubic);
    _shift = Tween<Offset>(begin: widget.offset, end: Offset.zero)
        .animate(CurvedAnimation(parent: _c, curve: Curves.easeOutCubic));

    scheduleMicrotask(() async {
      if (!mounted) return;
      if (widget.delay > Duration.zero) {
        await Future.delayed(widget.delay);
      }
      if (mounted) _c.forward();
    });
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _c,
      builder: (_, __) => Opacity(
        opacity: _opacity.value,
        child: Transform.translate(offset: _shift.value, child: widget.child),
      ),
    );
  }
}
