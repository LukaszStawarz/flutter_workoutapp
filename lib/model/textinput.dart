import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  TextInputWidget({
    super.key,
    required this.hintT,
    required this.backgroundColor,
    required this.keyboardType,
    required this.hideText,
    required this.validator,
    required this.onSaved,
  });

  final String hintT;
  final Color backgroundColor;
  static const BorderRadius _radius = BorderRadius.all(Radius.circular(20));
  final TextInputType keyboardType;
  final bool hideText;
  final String? Function(String?)? validator;
  final Function(String?) onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        style: const TextStyle(color: Color.fromRGBO(159, 111, 222, 1)),
        decoration: InputDecoration(
          fillColor: backgroundColor,
          filled: true,

          //iconColor: Color.fromRGBO(118, 50, 208, 1),

          enabledBorder: const OutlineInputBorder(
            borderRadius: _radius,
            borderSide: BorderSide(color: Color.fromRGBO(118, 50, 208, 1)),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: _radius,
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: _radius,
            borderSide: BorderSide(color: Colors.blue),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: _radius,
            borderSide: BorderSide(color: Colors.blue),
          ),
          hintText: hintT,
          hintStyle: const TextStyle(
            color: Color.fromRGBO(118, 50, 208, 1),
          ),
        ),
        keyboardType: keyboardType,
        autocorrect: false,
        obscureText: hideText,
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
//Color.fromRGBO(118, 50, 208, 1) - ciemniejszy

// Color.fromRGBO(159, 111, 222, 1) - jaśniejszy