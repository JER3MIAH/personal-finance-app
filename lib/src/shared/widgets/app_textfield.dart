import 'package:flutter/material.dart';
import 'package:personal_finance_app/src/shared/shared.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final VoidCallback? onTapClear;
  final String? Function(String?)? validator;
  final String? leadingIcon;
  final void Function(String)? onChanged;
  const AppTextField({
    super.key,
    required this.controller,
    this.labelText = '',
    required this.hintText,
    this.onTapClear,
    this.validator,
    this.onChanged,
    this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceType(context).isMobile;

    final border = OutlineInputBorder(
      borderSide: BorderSide(color: appColors.beige500),
      borderRadius: BorderRadius.circular(8),
    );

    return TextFormField(
      controller: controller,
      cursorColor: appColors.grey900,
      style: textPreset4,
      keyboardType: TextInputType.text,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: leadingIcon == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SvgAsset(
                  leadingIcon!,
                  color: appColors.grey900,
                ),
              ),
        errorStyle: const TextStyle(height: .0001),
        hintText: hintText,
        hintStyle: textPreset4.copyWith(
          color: appColors.beige500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 12,
        ),
        constraints: BoxConstraints(
          minHeight: 44,
          maxHeight: 44,
          minWidth: isMobile ? 200 : 320,
          maxWidth: isMobile ? 200 : 320,
        ),
        focusedBorder: border,
        enabledBorder: border,
        disabledBorder: border,
        focusedErrorBorder: border.copyWith(
          borderSide: BorderSide(color: appColors.red),
        ),
        errorBorder: border.copyWith(
          borderSide: BorderSide(color: appColors.red),
        ),
      ),
    );
  }
}

class PlainTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final FocusNode? focusNode;
  final int? hintMaxLines;
  final bool isHeader;
  final bool expands;
  final int? maxlines;

  const PlainTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.hintMaxLines,
    this.isHeader = false,
    this.expands = false,
    this.maxlines,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final tStyle = TextStyle(
      fontSize: isHeader ? 24 : 14,
      fontWeight: isHeader ? FontWeight.w700 : FontWeight.w400,
      color: theme.onSurface,
    );

    return TextField(
      style: tStyle,
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      onChanged: onChanged,
      maxLines: maxlines,
      expands: expands,
      onSubmitted: onSubmitted ??
          (_) {
            focusNode?.unfocus();
          },
      decoration: InputDecoration(
        hintText: hintText,
        hintMaxLines:
            hintMaxLines ?? (controller.text.trim().isNotEmpty ? 1 : 3),
        hintStyle: tStyle.copyWith(
          color: appColors.beige500,
        ),
        border: InputBorder.none,
        isDense: true,
      ),
    );
  }
}
