import 'package:flutter/material.dart';

class GlobalWidgets {
  static Widget customTextField({
    String? textFieldHint,
    TextEditingController? controller,
    bool hidden = false,
    String labelTxt = "",
    String? Function(String?)? textFieldValidator,
    void Function()? onSuffixTap,
    IconData? prfixIcon,
    IconData? sufixIcon
  }) {
    return TextFormField(
      obscureText: hidden,
      controller: controller,
      onTapOutside: (event) => FocusManager.instance.primaryFocus!.unfocus(),
      style: TextStyle(
        color: Colors.indigo,
        fontSize: 17,
        letterSpacing: -0.4,
      ),
      decoration: InputDecoration(
        hintText: textFieldHint,
        prefixIcon: prfixIcon == null ? null : Icon(
          prfixIcon,
          color: Color(0xFF363636),
          size: 25,
        ),
        suffixIcon: sufixIcon == null ? null : GestureDetector(
          onTap: onSuffixTap,
          child: Icon(
            sufixIcon,
            color: Color(0xFF363636),
            size: 25,
          ),
        ),
        label: labelTxt.isEmpty ? null : Text(
          labelTxt,
          style: TextStyle(
          color: Colors.indigo,
          fontSize: 17,
          letterSpacing: -0.4,
        ),
        ),
        hintStyle: TextStyle(
          color: Color(0xFF474747),
          fontSize: 17,
          letterSpacing: -0.4,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 2, color: Colors.indigo),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 2, color: Colors.green),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 2, color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 2, color: Colors.deepOrange),
        ),
      ),
      validator: textFieldValidator,
    );
  }
}
