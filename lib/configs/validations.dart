import 'package:flutter/material.dart';

class Decorations {
  static InputDecoration getNoBorderInputDecoration() {
    return InputDecoration(
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.only(left: 0));
  }

  static InputDecoration outlineInputDecoration(
      {String? error,
        VoidCallback? onTap,
        String? labelText}) =>
      InputDecoration(
        errorText: error,
        isDense: true,
        labelText: labelText,
        hintText: labelText,
        hintStyle: TextStyle(color: Colors.black),
        labelStyle: TextStyle(color: Colors.black),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIconConstraints: BoxConstraints(maxWidth: 50),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.red, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
      );
}
