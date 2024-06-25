import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:safeguard_app/common/color_extension.dart';

class LoadingUtils {
  static OverlayEntry? _overlayEntry;

  static void showHUD(
    BuildContext context, {
    String text = '',
  }) {
    double animationSize = 45;

    _overlayEntry = OverlayEntry(
      builder: (context) => Center(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: TColor.textfield,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              LoadingAnimationWidget.flickr(
                  size: animationSize,
                  leftDotColor: TColor.black,
                  rightDotColor: TColor.primary),
              // const SizedBox(height: 16),
              // Text(
              //   text,
              //   style: TextStyle(
              //     color: TColor.primaryText,
              //     fontSize: 14,
              //     fontWeight: FontWeight.w500,
              //     decoration: TextDecoration.none,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hideHUD() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}
