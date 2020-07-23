import 'package:flutter/material.dart';

class _CustomTextFieldWidget extends StatelessWidget {
  final TextInputType type;
  final InputDecoration decoration;
  final Function(String) onChanged;
  final bool obscureText;

  const _CustomTextFieldWidget({
    Key key,
    @required this.type,
    @required this.decoration,
    @required this.onChanged,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        keyboardType: type,
        textInputAction: TextInputAction.continueAction,
        textCapitalization: TextCapitalization.sentences,
        decoration: decoration.copyWith(
          border: OutlineInputBorder(),
        ),
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomEmailTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CustomTextFieldWidget(
      type: TextInputType.emailAddress,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: 'email...',
      ),
      onChanged: (value) {},
    );
  }
}

class CustomPasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _CustomTextFieldWidget(
      type: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock),
        hintText: 'password...',
      ),
      obscureText: true,
      onChanged: (value) {},
    );
  }
}
