import 'package:flutter/material.dart';
import 'package:tapinvest/core/utils/app_colors.dart';

class CustomInput extends StatelessWidget {
  const CustomInput({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.prefix,
    this.readOnly = false,
    this.maxLength,
    this.suffix = const SizedBox.shrink(),
    this.keyboardType,
    this.validator,
    this.onChange,
    this.onSaved,
  });

  final String hintText;
  final Widget? prefix;
  final Widget suffix;
  final bool readOnly;
  final int? maxLength;
  final TextEditingController textEditingController;
  final TextInputType? keyboardType;
  final Function(String value)? onChange;
  final Function(String? value)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onChanged: (value) => onChange?.call(value),
      onSaved: (value) => onSaved?.call(value),
      validator: (value) => validator?.call(value),
      cursorHeight: 25,
      cursorColor: AppColors.subtitleColor,
      readOnly: readOnly,
      maxLength: maxLength,
      enableInteractiveSelection: false,
      keyboardType: keyboardType,
      onTapOutside: (_) => FocusScope.of(context).requestFocus(FocusNode()),
      style: Theme.of(context).primaryTextTheme.displayMedium!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 15),
        counter: Offstage(),
        hintStyle: Theme.of(context).primaryTextTheme.displayMedium!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.subtitleColor,
        ),
        border: InputBorder.none,
        errorStyle: const TextStyle(height: double.minPositive),
        hintText: hintText,
        prefixIcon: prefix,
        suffixIcon: suffix,
      ),
    );
  }
}
