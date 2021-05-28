import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../resource/colors/app_colors.dart';
import '../../../utils/view/common_decoration.dart';

class PrimaryInputLayout extends StatelessWidget {
  final String title;
  final String hint;
  final int? maxLength;
  final TextInputType inputType;
  final Function(String)? onTextChanged;
  final focusNode = FocusNode();

  PrimaryInputLayout(
      {Key? key,
      required this.title,
      this.hint = '',
      this.maxLength,
      this.onTextChanged,
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: focusNode.requestFocus,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 13, 16, 13),
        width: 315,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [CommonDecoration.boxShadow()]),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 12, color: AppColors.raven),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              focusNode: focusNode,
              onChanged: onTextChanged,
              keyboardType: inputType,
              maxLength: maxLength,
              decoration: InputDecoration(
                  counterText: '',
                  contentPadding: const EdgeInsets.all(0),
                  isDense: true,
                  hintText: hint,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: AppColors.ghost)),
            )
          ],
        ),
      ),
    );
  }
}
