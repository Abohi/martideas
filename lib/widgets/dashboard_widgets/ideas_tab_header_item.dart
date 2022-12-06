import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/service_injections.dart';

import '../../dependency_injection/controllers_injections.dart';
import '../../gen/fonts.gen.dart';

class HeaderItem extends HookConsumerWidget{
  final Color bgColor;
  final String headerLabel;
  final Function onHeaderItemPressed;
  final ValueNotifier<bool> isActive;
  const HeaderItem({required this.bgColor,required this.headerLabel,required this.onHeaderItemPressed,required this.isActive});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: (){
        onHeaderItemPressed();
      },
      child: SizedBox(
        width: 50.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 45.w,
              height: 45.h,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10.r)
              ),
            ),
            SizedBox(height: 10.h,),
            Text(headerLabel,style: TextStyle(
                color: Colors.black,
                fontFamily: FontFamily.mono,
                fontWeight: FontWeight.w400,
                fontSize: 13.sp
            ),),
            SizedBox(height: 4.h,),
            Container(
              color: isActive.value?bgColor:Colors.transparent,
              width: 50.w,
              height: 4.h,
            )
          ],
        ),
      ),
    );
  }
}
class HeaderItem2 extends HookConsumerWidget{
  final Color bgColor;
  final String headerLabel;
  const HeaderItem2({required this.bgColor,required this.headerLabel,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 50.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10.r)
            ),
          ),
          SizedBox(height: 10.h,),
          Text(headerLabel,style: TextStyle(
              color: Colors.black,
              fontFamily: FontFamily.mono,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp
          ),),
        ],
      ),
    );
  }
}
