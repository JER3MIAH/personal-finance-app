import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class EmptyStateContainer extends StatelessWidget {
  final String title;
  const EmptyStateContainer({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: screenHeight / 3),
        child: Text(
          title,
          style: textPreset2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
