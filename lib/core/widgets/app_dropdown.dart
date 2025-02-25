import 'package:flutter/material.dart';
import 'package:fluttercore/core/utils/theme_extension.dart';

import 'app_colors.dart';

class AppDropdown extends StatefulWidget {
  final List<String> category;
  final String title;
  final String hint;
  final Color textHintColor;
  final String? errorText;
  final Function(String) onSelected;
  const AppDropdown({
    Key? key,
    required this.category,
    required this.title,
    required this.hint,
    required this.textHintColor,
    this.errorText,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<AppDropdown> createState() => _AppDropdownState();
}

class _AppDropdownState extends State<AppDropdown> {
  String? selectedCategory;
  bool focused = false;
  @override
  Widget build(BuildContext context) {
    return FocusScope(
      onFocusChange: (focus) => setState(() => focused = focus),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: context.textTheme.bodyMedium?.copyWith(
              color: widget.errorText != null
                  ? Colors.red
                  : focused && widget.textHintColor != Colors.white
                      ? AppColors.primary
                      : widget.textHintColor,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          DropdownButtonFormField<String>(
            isDense: true,
            icon: const Icon(Icons.keyboard_arrow_down_sharp),
            items: widget.category
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            value: null,
            onChanged: (item) => setState(() {
              var i = item as String;
              selectedCategory = i;
              widget.onSelected(i);
            }),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 4,
                horizontal: 4,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.softGray,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: AppColors.softGray,
                ),
              ),
              hintText: widget.hint,
              filled: true,
              fillColor: Colors.white,
              errorText: widget.errorText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Colors.black),
            ),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
