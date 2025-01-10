import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final double? fontSize;
  final bool expanded;
  final Color? color;
  final Color? textColor;
  final double? height;

  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.fontSize,
    this.expanded = false,
    this.color,
    this.textColor,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    Widget body() {
      return BounceInAnimation(
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(color ?? appColors.grey900),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            elevation: WidgetStatePropertyAll(0),
            padding: WidgetStatePropertyAll(EdgeInsets.all(spacing200)),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(spacing100),
              ),
            ),
            minimumSize: height != null
                ? WidgetStatePropertyAll(Size.fromHeight(height!))
                : null,
          ),
          child: Text(
            title,
            style: textPreset4Bold.copyWith(
              fontSize: fontSize,
              color: textColor ?? appColors.white,
            ),
          ),
        ),
      );
    }

    if (expanded) {
      return Row(
        children: [
          Expanded(child: body()),
        ],
      );
    }

    return body();
  }
}

class AddButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: BounceInAnimation(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(spacing100),
          decoration: BoxDecoration(
            color: appColors.grey900,
            borderRadius: BorderRadius.circular(spacing100),
          ),
          child: Icon(
            Icons.add,
            color: appColors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
