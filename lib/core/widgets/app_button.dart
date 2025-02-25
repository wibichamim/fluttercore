import 'package:flutter/material.dart';
import 'package:fluttercore/core/utils/theme_extension.dart';

import 'app_colors.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final Function onPressed;
  final String caption;
  final bool isEnabled;
  final bool isLoading;
  final Color outline;
  final TextStyle? textStyle;
  final double radius;
  const AppButton({
    super.key,
    this.color = AppColors.secondary,
    this.caption = 'Button',
    required this.onPressed,
    this.isEnabled = true,
    this.isLoading = false,
    this.outline = Colors.transparent,
    this.textStyle,
    this.radius = 10,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        OutlinedButton(
          onPressed: isEnabled == true && !isLoading ? () => onPressed() : null,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            backgroundColor: isEnabled == true ? color : Colors.grey,
            textStyle: textStyle ?? context.textTheme.labelLarge,
            minimumSize: const Size.fromHeight(48),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: isLoading,
                child: Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(right: 4),
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.white.withOpacity(0.5),
                  ),
                ),
              ),
              Text(
                caption,
                style: textStyle ?? context.textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
