import 'package:flutter/material.dart';

class _CustomTextFieldWidget extends StatelessWidget {
  final TextInputType type;
  final InputDecoration decoration;
  final Function(String) onChanged;
  final bool obscureText;
  final bool errorInField;

  const _CustomTextFieldWidget({
    Key key,
    @required this.type,
    @required this.decoration,
    @required this.onChanged,
    this.obscureText = false,
    this.errorInField = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: TextField(
        keyboardType: type,
        textCapitalization: TextCapitalization.sentences,
        decoration: decoration.copyWith(
          border: OutlineInputBorder(),
          errorText: errorInField ? 'Value Error' : null,
        ),
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomEmailTextField extends StatelessWidget {
  final Function onChanged;
  final bool errorInField;

  const CustomEmailTextField({
    Key key,
    this.onChanged,
    this.errorInField,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CustomTextFieldWidget(
      type: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'email...',
      ),
      onChanged: onChanged,
      errorInField: errorInField,
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  final Function onChanged;
  final bool errorInField;

  const CustomPasswordTextField({
    Key key,
    this.onChanged,
    this.errorInField,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _CustomTextFieldWidget(
      type: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'password...',
      ),
      obscureText: true,
      onChanged: onChanged,
      errorInField: errorInField,
    );
  }
}
