
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/controllers_injections.dart';

import '../../state_managers/state_providers/navigationStateProvider.dart';
import '../../state_managers/state_providers/tabRouterStateProvider.dart';

class CustomBottomNavigationBar extends HookConsumerWidget {

  const CustomBottomNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70.h,
      decoration: BoxDecoration(
          color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child:BottomNavItem(onButtonPressed: (){
              ref.read(navigationStateProvider.notifier).state=0;
              ref.read(tabRouteStateProvider.notifier).state?.setActiveIndex(ref.watch(navigationStateProvider));
            }, isSelected:ref.watch(navigationStateProvider)==0, iconWidget: Icon(Icons.home,color: ref.watch(navigationStateProvider)==0?const Color(0xff136AFB):const Color(0xffD9D9D9),),),
          ),
          Expanded(
            child:BottomNavItem(onButtonPressed: (){
              ref.read(navigationStateProvider.notifier).state=1;
              ref.read(tabRouteStateProvider.notifier).state?.setActiveIndex(ref.watch(navigationStateProvider));
            }, isSelected:ref.watch(navigationStateProvider)==1, iconWidget:Icon(Icons.bar_chart,color: ref.watch(navigationStateProvider)==0?const Color(0xff136AFB):const Color(0xffD9D9D9),),),
          ),
          GestureDetector(
            onTap: (){
              ref.read(navigationStateProvider.notifier).state=2;
              ref.read(tabRouteStateProvider.notifier).state?.setActiveIndex(ref.watch(navigationStateProvider));
            },
            child: Container(
              height: 52.h,
              width: 54.w,
              decoration: BoxDecoration(
                color: const Color(0xff136AFB),
                borderRadius: BorderRadius.circular(20.r)
              ),
              child: Icon(Icons.add,color: Colors.white,),
            ),
          ),
          Expanded(
            child:BottomNavItem(onButtonPressed: (){
              ref.read(navigationStateProvider.notifier).state=3;
              ref.read(tabRouteStateProvider.notifier).state?.setActiveIndex(ref.watch(navigationStateProvider));
            }, isSelected:ref.watch(navigationStateProvider)==3, iconWidget:Icon(Icons.file_copy,color: ref.watch(navigationStateProvider)==0?const Color(0xff136AFB):const Color(0xffD9D9D9),),),
          ),
          Expanded(
            child:BottomNavItem(onButtonPressed: (){
              ref.read(navigationStateProvider.notifier).state=4;
              ref.read(tabRouteStateProvider.notifier).state?.setActiveIndex(ref.watch(navigationStateProvider));
            }, isSelected:ref.watch(navigationStateProvider)==4, iconWidget:Icon(Icons.settings,color: ref.watch(navigationStateProvider)==0?const Color(0xff136AFB):const Color(0xffD9D9D9),),),
          ),
        ],
      ),
    );
  }
}

class BottomNavItem extends HookConsumerWidget {
  final bool isSelected;
  final Function onButtonPressed;
  final Widget iconWidget;
  const BottomNavItem(
      {required this.onButtonPressed,required this.isSelected,required this.iconWidget});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return isSelected?SizedBox(
      width: 57.w,
      height: 58.h,
      child: Card(
        color: Colors.white,
        elevation: 10,
        child:IconButton(onPressed:(){
          onButtonPressed();
        }, icon: iconWidget),
        shape: CircleBorder(side: BorderSide(color: Colors.white)),
      ),
    ):IconButton(onPressed:(){
      onButtonPressed();
    }, icon: iconWidget);
  }
}