import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/utils/utils.dart';
import 'package:martideas/widgets/dashboard_widgets/ideas_tab_header_item.dart';

import '../../state_managers/state_providers/ideasTabsStateProvider.dart';



class CustomIdeasTabBar extends HookConsumerWidget {
  final String? firstTabLabel,secondTabLabel,thirdTabLabel,fourthTabLabel;
  const CustomIdeasTabBar({this.firstTabLabel,this.secondTabLabel,this.thirdTabLabel,this.fourthTabLabel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size =MediaQuery.of(context).size;
    var firstTabValueNotifier=useState<bool>(true);
    var secondTabNotifier=useState<bool>(false);
    var thirdTabNotifier=useState<bool>(false);
    var fourthTabValueNotifier=useState<bool>(false);
    var fifthTabValueNotifier=useState<bool>(false);
    return Container(
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: HeaderItem(headerLabel: firstTabLabel??"Commerce", onHeaderItemPressed: (){

              ref.read(isFirstTabStateProvider.notifier).state=true;
              ref.read(isSecondTabStateProvider.notifier).state=false;
              ref.read(isThirdTabStateProvider.notifier).state=false;
              ref.read(isForthTabStateProvider.notifier).state=false;
              ref.read(isFifthTabStateProvider.notifier).state=false;

              firstTabValueNotifier.value=true;
              secondTabNotifier.value=false;
              thirdTabNotifier.value=false;
              fourthTabValueNotifier.value=false;
              fifthTabValueNotifier.value=false;

            }, isActive: firstTabValueNotifier, bgColor: const Color(0xffFB4EB6),),
          ),
          Expanded(
            child: HeaderItem(headerLabel: secondTabLabel??"Tech", onHeaderItemPressed: (){
              ref.read(isFirstTabStateProvider.notifier).state=false;
              ref.read(isSecondTabStateProvider.notifier).state=true;
              ref.read(isThirdTabStateProvider.notifier).state=false;
              ref.read(isForthTabStateProvider.notifier).state=false;
              ref.read(isFifthTabStateProvider.notifier).state=false;

              firstTabValueNotifier.value=false;
              secondTabNotifier.value=true;
              thirdTabNotifier.value=false;
              fourthTabValueNotifier.value=false;
              fifthTabValueNotifier.value=false;
            }, isActive: secondTabNotifier, bgColor: const Color(0xffC19AF8),),
          ),
          Expanded(
            child: HeaderItem(headerLabel: thirdTabLabel??"Science", onHeaderItemPressed: (){
              ref.refresh(isFirstTabStateProvider.notifier).state=false;
              ref.refresh(isSecondTabStateProvider.notifier).state=false;
              ref.refresh(isThirdTabStateProvider.notifier).state=true;
              ref.refresh(isForthTabStateProvider.notifier).state=false;
              ref.refresh(isFifthTabStateProvider.notifier).state=false;

              firstTabValueNotifier.value=false;
              secondTabNotifier.value=false;
              thirdTabNotifier.value=true;
              fourthTabValueNotifier.value=false;
              fifthTabValueNotifier.value=false;
            }, isActive: thirdTabNotifier, bgColor: const Color(0xffEFA363),),
          ),
          Expanded(
            child: HeaderItem(headerLabel: fourthTabLabel??"Farming", onHeaderItemPressed: (){
              ref.refresh(isFirstTabStateProvider.notifier).state=false;
              ref.refresh(isSecondTabStateProvider.notifier).state=false;
              ref.refresh(isThirdTabStateProvider.notifier).state=false;
              ref.refresh(isForthTabStateProvider.notifier).state=true;
              ref.refresh(isFifthTabStateProvider.notifier).state=false;

              firstTabValueNotifier.value=false;
              secondTabNotifier.value=false;
              thirdTabNotifier.value=false;
              fourthTabValueNotifier.value=true;
              fifthTabValueNotifier.value=false;
            }, isActive: fourthTabValueNotifier, bgColor: const Color(0xffA7F6AA),),
          ),
          Expanded(
            child: HeaderItem(headerLabel: fourthTabLabel??"Others", onHeaderItemPressed: (){
              ref.refresh(isFirstTabStateProvider.notifier).state=false;
              ref.refresh(isSecondTabStateProvider.notifier).state=false;
              ref.refresh(isThirdTabStateProvider.notifier).state=false;
              ref.refresh(isForthTabStateProvider.notifier).state=false;
              ref.refresh(isFifthTabStateProvider.notifier).state=true;

              firstTabValueNotifier.value=false;
              secondTabNotifier.value=false;
              thirdTabNotifier.value=false;
              fourthTabValueNotifier.value=false;
              fifthTabValueNotifier.value=true;
            }, isActive: fifthTabValueNotifier, bgColor: const Color(0xff6C7AF2),),
          )
        ],
      ),
    );
  }
}
class CustomIdeasHomeBar extends StatelessWidget {
  const CustomIdeasHomeBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = screenSize(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:  SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              child: HeaderItem2(headerLabel:"Commerce", bgColor: Color(0xffFB4EB6),),
            ),
            Expanded(
              child: HeaderItem2(headerLabel: "Tech",  bgColor: Color(0xffC19AF8),),
            ),
            Expanded(
              child: HeaderItem2(headerLabel: "Science", bgColor: Color(0xffEFA363),),
            ),
            Expanded(
              child: HeaderItem2(headerLabel: "Farming",  bgColor: Color(0xffA7F6AA),),
            ),
            Expanded(
              child: HeaderItem2(headerLabel: "Others",  bgColor: Color(0xff6C7AF2),),
            )
          ],
        ),
      ),
    );
  }
}

