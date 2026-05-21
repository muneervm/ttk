import 'package:flutter/material.dart';

class AppInkWell extends StatelessWidget {
  const AppInkWell({Key? key, this.child, this.borderRadius = 0, this.onTap})
      : super(key: key);

  final Widget? child;

  final double borderRadius;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child ?? const SizedBox(),
        Positioned.fill(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  child: const SizedBox(),
                )),
          ),
        )
      ],
    );
  }
}
