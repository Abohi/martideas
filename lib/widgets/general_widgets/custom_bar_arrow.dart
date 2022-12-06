import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackArrow extends StatelessWidget {
  final Function onButtonPressed;
  const CustomBackArrow({required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: 21.w,
        height: 21.h,
        decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xff136AFB)
        ),
        child: const Center(
          child: Icon(Icons.arrow_back_ios,size: 10,),
        ),
      ),
    );
  }
}