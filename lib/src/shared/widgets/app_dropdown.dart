import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AppDropdown extends StatelessWidget {
  final ValueNotifier dropdownValue;
  final List<String> items;
  const AppDropdown({
    super.key,
    required this.dropdownValue,
    required this.items,
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
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style:
                  dropdownValue.value == value ? textPreset4Bold : textPreset4,
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
