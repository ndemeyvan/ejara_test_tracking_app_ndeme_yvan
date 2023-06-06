import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/animation/fade_animation.dart';

class TrackingLoginScreenInput extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? placeholder;
  final bool obscurText;
  final void Function(String? value)? onChanged;
  final String? Function(String? value) validator;
  final TextInputType textInput;
  final TextInputAction textInputAction;

  const TrackingLoginScreenInput({
    Key? key,
    required this.fieldController,
     this.textInput = TextInputType.text,
     this.textInputAction = TextInputAction.done,
    required this.validator,
    required this.obscurText,
    required this.onChanged,
    required this.placeholder,
  }) : super(key: key);

  @override
  State<TrackingLoginScreenInput> createState() => _TrackingLoginScreenInputState();
}

class _TrackingLoginScreenInputState extends State<TrackingLoginScreenInput> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(0.3, TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            horizontal: 10, vertical: 0) +
            EdgeInsets.only(left: 13.w),
        // fillColor: Colors.grey.withOpacity(0.2),
        // filled: true,
        hintText: widget.placeholder,
        hintStyle:
        TextStyle(color: Colors.grey.withOpacity(0.8)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2, color: Colors.grey.withOpacity(0.5)),
          borderRadius: BorderRadius.circular(5.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 2, color: Colors.red),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      keyboardType: TextInputType.text,
      validator: widget.validator,
      obscureText: widget.obscurText,
      onChanged: widget.onChanged,
      // onSaved: (String? val) {
      //   _userName = val;
      // },
    ));
  }
}
