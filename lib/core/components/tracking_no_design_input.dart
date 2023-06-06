import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ndeme_yvan_tracking_plan/core/animation/fade_animation.dart';

import '../theme/theme.dart';

class TrackingNoDesignInput extends StatefulWidget {
  final TextEditingController? fieldController;
  final String? placeholder;
  final bool obscurText;
  final void Function(String? value)? onChanged;
  final String? Function(String? value) validator;
  final TextInputType textInput;
  final TextInputAction textInputAction;

  const TrackingNoDesignInput({
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
  State<TrackingNoDesignInput> createState() => _TrackingNoDesignInputState();
}

class _TrackingNoDesignInputState extends State<TrackingNoDesignInput> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        0.5,
        TextFormField(
          controller: widget.fieldController,
          style: TextStyle(color: BLACKCOLOR, fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            isDense: true,
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0),
            ),
            fillColor: Colors.grey.withOpacity(0.2),
            hintText: widget.placeholder,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 2, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5.0),
            ),
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.6),
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
          keyboardType: widget.textInput,
          validator: widget.validator,
          obscureText: widget.obscurText,
          onSaved: (String? val) {},
        ));
  }
}
