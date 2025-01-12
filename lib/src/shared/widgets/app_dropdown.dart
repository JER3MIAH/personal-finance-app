import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AppDropdown extends StatelessWidget {
  final ValueNotifier<String> dropdownValue;
  final List<String> items;
  final List<String> disbledItems;
  const AppDropdown({
    super.key,
    required this.dropdownValue,
    required this.items,
    this.disbledItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: appColors.beige500,
        ),
        borderRadius: BorderRadius.circular(spacing100),
      ),
      child: DropdownButton<String>(
        value: dropdownValue.value,
        style: textPreset4,
        icon: Icon(Icons.arrow_drop_down),
        underline: SizedBox(),
        onChanged: (String? newValue) {
          dropdownValue.value = newValue!;
        },
        menuMaxHeight: 500,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            enabled: !disbledItems.contains(value),
            value: value,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 30,
              children: [
                Text(
                  value,
                  style: (dropdownValue.value == value
                          ? textPreset4Bold
                          : textPreset4)
                      .copyWith(
                    color:
                        disbledItems.contains(value) ? appColors.grey500 : null,
                  ),
                ),
                if (disbledItems.contains(value))
                  Text(
                    'already exists',
                    style: textPreset4.copyWith(
                      color: appColors.grey300,
                    ),
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ThemeDropdown extends StatelessWidget {
  final ValueNotifier<String> dropdownValue;
  final List<String> items;
  final List<String> disbledItems;
  const ThemeDropdown({
    super.key,
    required this.dropdownValue,
    required this.items,
    this.disbledItems = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: appColors.beige500,
        ),
        borderRadius: BorderRadius.circular(spacing100),
      ),
      child: DropdownButton<String>(
        value: dropdownValue.value,
        style: textPreset4,
        icon: Icon(Icons.arrow_drop_down),
        underline: SizedBox(),
        onChanged: (String? newValue) {
          dropdownValue.value = newValue!;
        },
        menuMaxHeight: 500,
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            enabled: !disbledItems.contains(value),
            value: value,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getColorFromTheme(value),
                  ),
                ),
                Text(
                  value,
                  style: (dropdownValue.value == value
                          ? textPreset4Bold
                          : textPreset4)
                      .copyWith(
                    color:
                        disbledItems.contains(value) ? appColors.grey500 : null,
                  ),
                ),
                if (disbledItems.contains(value))
                  Row(
                    children: [
                      XBox(30),
                      Text(
                        'already used',
                        style: textPreset4.copyWith(
                          color: appColors.grey300,
                        ),
                      ),
                    ],
                  )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class AppPopUpButton extends StatelessWidget {
  final ValueNotifier selectedItem;
  final String icon;
  final List<String> items;
  const AppPopUpButton({
    super.key,
    required this.selectedItem,
    required this.items,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      constraints: BoxConstraints(maxHeight: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: appColors.white,
      itemBuilder: (_) {
        return List.generate(
          items.length,
          (index) {
            final menuItem = items[index];
            return PopupMenuItem(
              onTap: () {
                selectedItem.value = menuItem;
              },
              child: Text(
                menuItem,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            );
          },
        );
      },
      child: SvgAsset(icon),
    );
  }
}

class EditAndDeletePopUpButton extends StatelessWidget {
  final String title;
  final VoidCallback onEdit, onDelete;
  const EditAndDeletePopUpButton({
    super.key,
    required this.title,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Widget>(
      padding: EdgeInsets.zero,
      position: PopupMenuPosition.under,
      constraints: BoxConstraints(maxHeight: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(spacing100),
      ),
      color: appColors.white,
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            onTap: onEdit,
            child: Text(
              'Edit $title',
              style: textPreset4,
            ),
          ),
          PopupMenuItem(
            onTap: onDelete,
            child: Text(
              'Delete $title',
              style: textPreset4.copyWith(color: appColors.red),
            ),
          ),
        ];
      },
      child: Icon(
        Icons.more_horiz,
        color: appColors.grey300,
      ),
    );
  }
}
