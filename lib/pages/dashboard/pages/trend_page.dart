import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TrendPage extends HookConsumerWidget {
  const TrendPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text("Treding Ideas...\n Coming Soon",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
      ),
    );
  }
}
