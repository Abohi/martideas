import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/app_routes/app_route.gr.dart';
import 'package:martideas/dependency_injection/repositories_injections.dart';
import 'package:martideas/state_managers/state_providers/ideaLikedIdStateProvider.dart';
import 'package:martideas/utils/utils.dart';
import 'package:martideas/widgets/dashboard_widgets/ideas_tab_header_item.dart';
import 'package:martideas/widgets/dashboard_widgets/ideas_list_item.dart';
import 'package:martideas/widgets/general_widgets/custom_textfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../dependency_injection/controllers_injections.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/ideas_model/create_ideas_model.dart';
import '../../../widgets/dashboard_widgets/ideas_custom_tab_bar.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = screenSize(context);
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 32.h,
                ),
                Text(
                  "Create ideas",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  "Got any ideas today? ",
                  style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w500,
                      fontSize: 30.sp),
                ),
                SizedBox(
                  height: 33.h,
                ),
                CustomIdeasHomeBar(),
                SizedBox(
                  height: 33.h,
                ),
              ],
            ),
          ),
          ref.watch(ideaListControllerProvider) == null
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: Text("No ideas"),
                  ),
                )
              : SliverList(
                  delegate: SliverChildListDelegate(ref
                      .watch(ideaListControllerProvider)!
                      .map((e) => IdeasListItem(
                            createIdeaModel: e, onButtonPressed: (){
                              ref.read(ideasIdStateProvider.notifier).state=e.ideaId!;
                              context.router.navigate(IdeaDetailRoute(createIdeaModel: e));
                  },
                          ))
                      .toList()),
                )
        ],
      ),
    );
  }
}
