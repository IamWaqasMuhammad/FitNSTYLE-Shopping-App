import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? searchController;
  final String? Function(String?)? searchValidator;
  final double? radius;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.searchController,
    this.searchValidator,
    this.radius
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hintText: hintText,
      keyboardType: keyboardType,
      prefixIcon: prefixIcon,
      controller: searchController,
      suffixIcon: suffixIcon,
      textInputAction: TextInputAction.search,
      validator: searchValidator,
    );
  }
}
