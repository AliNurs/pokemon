import 'package:flutter/material.dart';
import 'package:pocemons_app/themes/app_colors.dart';

import '../themes/text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.fieldText,
      style: AppTextStyles.poppins14w500,
      decoration: InputDecoration(
        hintText: 'Search Here...',
        hintStyle: AppTextStyles.poppins14w500,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: AppColors.itemPoints,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 0,
        ),
      ),
    );
  }
}
