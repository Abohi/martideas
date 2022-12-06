import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/repositories_injections.dart';
import 'package:martideas/gen/fonts.gen.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';
import 'package:martideas/utils/utils.dart';
import 'package:martideas/widgets/general_widgets/custom_button.dart';
import 'package:martideas/widgets/general_widgets/custom_textfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../app_routes/app_route.gr.dart';
final passwordToggleStateProvider = StateProvider<bool>((ref){
  return  false;
});
final confirmPasswordToggleStateProvider = StateProvider<bool>((ref){
  return  false;
});
class SignupPage extends HookConsumerWidget {
  const SignupPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = screenSize(context);
    var passwordTextEditingController = useTextEditingController();
    var confirmPasswordTextEditingController = useTextEditingController();
    var emailTextEditingController= useTextEditingController();
    return SafeArea(
      child: WillPopScope(
        onWillPop: ()async{
          context.popRoute();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: ProgressHUD(
            backgroundColor:const Color(0xff136AFB),
            indicatorColor: Colors.white,
            child: Builder(
              builder: (context){
                return Container(
                  width: size.width,
                  height: size.height,
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 100.h,),
                        Text("Sign up",style: TextStyle(
                            color: Color(0xff333333),
                            fontFamily: FontFamily.mono,
                            fontWeight: FontWeight.w500,
                            fontSize: 30.sp
                        ),),
                        SizedBox(height: 39.h,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Username",style: TextStyle(
                                color: Color(0xff333333),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp
                            ),),
                            SizedBox(height: 11.h,),
                            CustomTextField(textInputType: TextInputType.emailAddress, labelText: "Enter Email Address", textFieldLabelStyle: TextStyle(
                                color: Color(0xffB7B7B7),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp
                            ),textEditingController: emailTextEditingController,)
                          ],
                        ),
                        SizedBox(height: 27.h,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Password",style: TextStyle(
                                color: Color(0xff333333),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp
                            ),),
                            SizedBox(height: 11.h,),
                            CustomTextField(textInputType: TextInputType.visiblePassword, labelText: "Enter Password", textFieldLabelStyle: TextStyle(
                                color: Color(0xffB7B7B7),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp
                            ),isPassword:true,passwordTogglerState:passwordToggleStateProvider,textEditingController: passwordTextEditingController,)
                          ],
                        ),
                        SizedBox(height: 27.h,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Confirm Password",style: TextStyle(
                                color: Color(0xff333333),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp
                            ),),
                            SizedBox(height: 11.h,),
                            CustomTextField(textInputType: TextInputType.visiblePassword, labelText: "Enter Password", textFieldLabelStyle: TextStyle(
                                color: Color(0xffB7B7B7),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp
                            ),isPassword:true,passwordTogglerState:confirmPasswordToggleStateProvider,textEditingController: confirmPasswordTextEditingController,)
                          ],
                        ),
                        SizedBox(height: 77.h,),
                        CustomButton(buttonLabel: "Register", buttonLabelStyle:TextStyle(
                            color:Colors.white,
                            fontFamily: FontFamily.mono,
                            fontWeight: FontWeight.w500,
                            fontSize: 15.sp
                        ), onButtonPressed:()async{
                          if(passwordTextEditingController.text.isEmpty || confirmPasswordTextEditingController.text.isEmpty || emailTextEditingController.text.isEmpty){
                            await Fluttertoast.showToast(msg: "Field cannot be empty");
                            return;
                          }
                          if(passwordTextEditingController.text.toString().trim()!=confirmPasswordTextEditingController.text.toString().trim()){
                            await Fluttertoast.showToast(msg: "Password do not match");
                            return;
                          }
                          final progress = ProgressHUD.of(context);
                          progress!.showWithText('Register User...');
                          Either<FirebaseAuthException,void> response =  await ref.read(authRepositoryProvider).registerUser(registerRequestModel: RegisterRequestModel(email: emailTextEditingController.text.toString().trim(), password: passwordTextEditingController.text.toString().trim()));
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
                              const CustomSnackBar.info(
                                backgroundColor: Color(0xff136AFB),
                                message:"Login Successfully",
                              ),
                            );
                            context.router.replaceAll([const DashboardControllerRoute()]);
                          });
                        }, buttonBg: const Color(0xff136AFB)),
                        SizedBox(height: 39.h,),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
