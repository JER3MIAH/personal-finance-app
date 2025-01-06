import 'package:flutter/widgets.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class PotsOverviewContainer extends StatelessWidget {
  final VoidCallback onSeeDetails;
  const PotsOverviewContainer({
    super.key,
    required this.onSeeDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing300),
      decoration: BoxDecoration(
        color: appColors.white,
        borderRadius: BorderRadius.circular(spacing150),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'Pots',
                style: textPreset2,
              ),
              _buildSeeDetails(
                onTap: onSeeDetails,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSeeDetails({required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(
            'See Details',
            style: textPreset4.copyWith(color: appColors.grey500),
          ),
          SvgAsset(iconCaretRight),
        ],
      ),
    );
  }
}
