import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikedIdeasPage extends HookConsumerWidget {
  const LikedIdeasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text("Your Liked Ideas...\n Coming Soon",style: TextStyle(color: Colors.white,fontSize: 15.sp),),
      ),
    );
  }
}
