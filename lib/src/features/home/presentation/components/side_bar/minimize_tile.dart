import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class MinimizeTile extends StatelessWidget {
  final bool isMinimized;
  final VoidCallback onTap;
  const MinimizeTile({
    super.key,
    required this.isMinimized,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 56,
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(
            horizontal: isMinimized ? 0 : spacing400,
            vertical: spacing200,
          ),
          child: isMinimized
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: spacing200),
                    child: SvgAsset(
                      iconExpandMenu,
                      color: appColors.grey300,
                    ),
                  ),
                )
              : Row(
                  children: [
                    SvgAsset(
                      iconMinimizeMenu,
                      color: appColors.grey300,
                    ),
                    XBox(20),
                    Text(
                      'Minimize Menu',
                      style: textPreset3.copyWith(
                        fontWeight: FontWeight.w700,
                        color: appColors.grey300,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
