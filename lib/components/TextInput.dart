import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  TextInput({@required this.labelText, this.validatiorFunc, this.onChangedFunc, this.obscureText});

  final String labelText;
  final bool obscureText;
  final FormFieldValidator<String> validatiorFunc;
  final ValueChanged<String> onChangedFunc; 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChangedFunc(value),
      validator: (value) =>  validatiorFunc(value),
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: this.labelText,
          labelStyle: TextStyle(fontSize: 20),
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey[100]))),
    );
  }
}

class RoundedInput extends StatelessWidget {
  RoundedInput({@required this.labelText, this.validatiorFunc, this.onChangedFunc, this.obscureText});
  final labelText;
  final bool obscureText;
  final FormFieldValidator<String> validatiorFunc;
  final ValueChanged<String> onChangedFunc; 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child:
          TextInput(
            labelText: this.labelText, 
            obscureText: obscureText,
            validatiorFunc: validatiorFunc,
            onChangedFunc: onChangedFunc,
            ),
    );
  }
}
