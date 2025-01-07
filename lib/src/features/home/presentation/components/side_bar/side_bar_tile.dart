import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class SideBarTile extends StatelessWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final bool isMinimized;
  final VoidCallback onTap;

  const SideBarTile({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
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
          margin: EdgeInsets.only(right: isMinimized ? spacing200 : spacing400),
          padding: EdgeInsets.symmetric(
            horizontal: isMinimized ? 0 : spacing400,
            vertical: spacing200,
          ),
          decoration: BoxDecoration(
            color: isSelected ? appColors.white : null,
            border: Border(
              left: BorderSide(
                color: isSelected ? appColors.green : Colors.transparent,
                width: 4,
              ),
            ),
            borderRadius: BorderRadius.horizontal(
              right: Radius.circular(12),
            ),
          ),
          child: isMinimized
              ? Center(
                  child: SvgAsset(
                    icon,
                    color: isSelected ? appColors.green : null,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SvgAsset(
                      icon,
                      color: isSelected ? appColors.green : null,
                    ),
                    XBox(20),
                    Text(
                      title,
                      style: textPreset3.copyWith(
                        fontWeight: FontWeight.w700,
                        color:
                            isSelected ? appColors.grey900 : appColors.grey300,
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
