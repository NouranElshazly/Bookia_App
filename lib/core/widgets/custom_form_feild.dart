import 'package:flutter/material.dart';

class CustomFormFeild extends StatefulWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomFormFeild({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomFormFeild> createState() => _CustomFormFeildState();
}

class _CustomFormFeildState extends State<CustomFormFeild> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : null,
      ),
    );
  }
}
