import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../resource/colors/app_colors.dart';
import '../decoration/box_shadow.dart';

class PrimaryInputLayout extends StatefulWidget {
  final String title;
  final String hint;
  final int? maxLength;
  final TextInputType inputType;
  final Function(String)? onTextChanged;

  PrimaryInputLayout(
      {Key? key,
      required this.title,
      this.hint = '',
      this.maxLength,
      this.onTextChanged,
      this.inputType = TextInputType.text})
      : super(key: key);

  @override
  _PrimaryInputLayoutState createState() => _PrimaryInputLayoutState();
}

class _PrimaryInputLayoutState extends State<PrimaryInputLayout> {
  final focusNode = FocusNode();
  bool _isObscure = true;

  bool get _isPasswordField =>
      widget.inputType == TextInputType.visiblePassword;

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
            boxShadow: [boxShadow()]),
        child: Column(
          children: [
            Text(
              widget.title,
              style: TextStyle(fontSize: 12, color: AppColors.raven),
            ),
            const SizedBox(
              height: 12,
            ),
            TextField(
              obscureText: _isObscure && _isPasswordField,
              style: Theme.of(context).textTheme.bodyText1,
              focusNode: focusNode,
              onChanged: widget.onTextChanged,
              keyboardType: widget.inputType,
              maxLength: widget.maxLength,
              decoration: InputDecoration(
                  counterText: '',
                  contentPadding: const EdgeInsets.symmetric(vertical: 5),
                  isDense: true,
                  suffixIconConstraints: const BoxConstraints(maxHeight: 25),
                  suffixIcon: _isPasswordField
                      ? IconButton(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          splashColor: Colors.transparent,
                          icon: Icon(_isObscure
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          })
                      : null,
                  hintText: widget.hint,
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: AppColors.ghost)),
            ),
          ],
        ),
      ),
    );
  }
}
