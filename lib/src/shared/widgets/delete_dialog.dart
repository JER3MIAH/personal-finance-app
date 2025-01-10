import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onDelete;
  const DeleteDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    void closeModal() {
      AppNavigator(context).popDialog();
    }

    return Padding(
      padding: EdgeInsets.all(spacing300),
      child: Column(
        spacing: 20,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delete `$title`',
                style: textPreset1,
              ),
              GestureDetector(
                onTap: closeModal,
                child: SvgAsset(iconCloseModal),
              ),
            ],
          ),
          Text(
            description,
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 3,
            children: [
              AppButton(
                title: 'Yes, Confirm Deletion',
                color: appColors.red,
                onTap: onDelete,
                height: 53,
                expanded: true,
              ),
              AppButton(
                title: 'No, Go Back',
                color: Colors.transparent,
                onTap: closeModal,
                textColor: appColors.grey500,
                height: 53,
                expanded: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
