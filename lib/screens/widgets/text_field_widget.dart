import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller; 
  const CustomTextField({
    Key? key, this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.purple[200],
      decoration: InputDecoration(
        fillColor: const Color(0xffFFFFFF),
        filled: true,
        hintText: 'Enter some text, please',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide.none,
        ),
      ),
      controller: controller,
    );
  }
}