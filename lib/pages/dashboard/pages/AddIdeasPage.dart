import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/controllers_injections.dart';
import 'package:martideas/dependency_injection/repositories_injections.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';
import 'package:martideas/state_managers/state_providers/navigationStateProvider.dart';
import 'package:martideas/state_managers/state_providers/tabRouterStateProvider.dart';
import 'package:martideas/utils/utils.dart';
import 'package:martideas/widgets/general_widgets/custom_button.dart';
import 'package:martideas/widgets/general_widgets/custom_textfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../gen/fonts.gen.dart';
import '../../../widgets/dashboard_widgets/ideas_custom_tab_bar.dart';
import '../../../widgets/dashboard_widgets/ideas_tab_header_item.dart';

class AddIdeasPage extends HookConsumerWidget {
  const AddIdeasPage({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = screenSize(context);
    var titleTextEditingController = useTextEditingController();
    var descriptionTextEditingController = useTextEditingController();
    return ProgressHUD(
        backgroundColor:const Color(0xff136AFB),
        indicatorColor: Colors.white,
        child:Builder(
      builder: (context){
        return Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 22.h,),
              Center(
                child: Text("Create ideas",style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: FontFamily.mono,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp
                ),),
              ),
              SizedBox(height: 16.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title",style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp
                  ),),
                  SizedBox(height: 11.h,),
                  CustomTextField(textInputType: TextInputType.text, labelText: "Enter Title", textFieldLabelStyle: TextStyle(
                      color: Color(0xffB7B7B7),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp
                  ),textEditingController: titleTextEditingController,)
                ],
              ),
              SizedBox(height: 16.h,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Description",style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w500,
                      fontSize: 13.sp
                  ),),
                  SizedBox(height: 11.h,),
                  CustomTextField(textInputType: TextInputType.multiline, labelText: "Enter Description", textFieldLabelStyle: TextStyle(
                      color: Color(0xffB7B7B7),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp
                  ),textEditingController: descriptionTextEditingController,maxLines: 4,)
                ],
              ),
              SizedBox(height: 30.h,),
              CustomIdeasTabBar(),
              SizedBox(height: 40.h,),
              CustomButton(buttonLabel: "Add To Category", buttonLabelStyle:TextStyle(
                  color:Colors.white,
                  fontFamily: FontFamily.mono,
                  fontWeight: FontWeight.w500,
                  fontSize: 15.sp
              ), onButtonPressed:()async{
                if(titleTextEditingController.text.toString().isEmpty || descriptionTextEditingController.text.isEmpty){
                  await Fluttertoast.showToast(msg: "Field cannot be empty");
                  return;
                }
                final progress = ProgressHUD.of(context);
                progress!.showWithText('Creating Ideas...');
                Either<FirebaseException, void> response = await ref.read(ideasRepositoryProvider).createIdeas(createIdeaModel: CreateIdeaModel(title:titleTextEditingController.text.toString().trim(), description:descriptionTextEditingController.text.toString().trim(), categoryColor:getSelectedIdeasTab(ref).color, categoryName: getSelectedIdeasTab(ref).title.toLowerCase(), authorId:ref.read(authControllerProvider)!.uid, ideaCreatedTime: DateTime.now()),);
                response.fold((l){
                  progress.dismiss();
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(
                      backgroundColor: const Color(0xffcf4537),
                      message:l.message??"",
                    ),
                  );
                }, (r){
                  progress.dismiss();
                  showTopSnackBar(
                    context,
                    CustomSnackBar.error(
                      backgroundColor: const Color(0xffcf4537),
                      message:"Ideas created successfully",
                    ),
                  );
                  ref.read(tabRouteStateProvider)?.setActiveIndex(0);
                  ref.read(navigationStateProvider.notifier).state=0;
                });
              }, buttonBg: const Color(0xff136AFB)),
            ],
          ),
        );
      },
    ));
  }
}
