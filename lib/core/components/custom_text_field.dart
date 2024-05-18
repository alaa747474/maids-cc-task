
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? svgIconPath;
  final bool isObscureText;
  final bool isEmailField;
  final bool isPasswordField;
  final String? errorText;
  final InputBorder? border;
  final IconButton? iconButton;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.svgIconPath,
      this.isObscureText = false,
      this.validator,
      this.isPasswordField = false,
      this.isEmailField = false,
      this.errorText,
      this.iconButton,
      this.border});

  @override
  State<CustomTextField> createState() => _CustomAuthTextFieldState();
}

class _CustomAuthTextFieldState extends State<CustomTextField> {
  bool autoValidate = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(

          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.isObscureText,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal),
          decoration: InputDecoration(
              border: widget.border,
              suffixIconConstraints:
                  BoxConstraints(minWidth: 18.w, minHeight: 18.h),
              suffixIcon: widget.isPasswordField ? widget.iconButton : null,
              contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              hintText: widget.hintText,
              prefixIconConstraints:
                  BoxConstraints(minWidth: 18.w, minHeight: 18.h),
          
              focusedBorder: OutlineInputBorder(
                borderSide: widget.errorText != null && autoValidate
                    ? BorderSide(color: Theme.of(context).colorScheme.error)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(6.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: widget.errorText != null && autoValidate
                    ? BorderSide(color: Theme.of(context).colorScheme.error)
                    : BorderSide.none,
                borderRadius: BorderRadius.circular(6.r),
              ),
              errorStyle: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
              filled: true,
              fillColor: Theme.of(context).highlightColor),
        ),
        // if (widget.errorText != null && autoValidate)
        //   Container(
        //     width: MediaQuery.sizeOf(context).width,
        //     height: 30.h,
        //     decoration: BoxDecoration(
        //         color: const Color(0xffFEEFEF),
        //         borderRadius: BorderRadius.circular(6.r)),
        //     child: Row(
        //       children: [
        //         Padding(
        //           padding: EdgeInsets.symmetric(horizontal: 12.w),
        //           child: Icon(
        //             Icons.error,
        //             color: Theme.of(context).colorScheme.error,
        //             size: 16.r,
        //           ),
        //         ),
        //         Text(
        //           widget.errorText!,
        //           style: TextStyle(color: Theme.of(context).colorScheme.error),
        //         ),
        //       ],
        //     ),
        //   ),
      ],
    );
  }
}