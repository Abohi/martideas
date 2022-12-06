
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String buttonLabel;
  final TextStyle buttonLabelStyle;
  final Function onButtonPressed;
  final Color buttonBg;
  const CustomButton({required this.buttonLabel,required this.buttonLabelStyle,required this.onButtonPressed,required this.buttonBg});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        onButtonPressed();
      },
      child: Container(
        width: size.width,
        height: 47.h,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: buttonBg
        ),
        child: Center(
          child: Text(buttonLabel,style: buttonLabelStyle,),
        ),
      ),
    );
  }
}
