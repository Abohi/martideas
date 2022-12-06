import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/app_routes/app_route.gr.dart';
import 'package:martideas/dependency_injection/repositories_injections.dart';
import 'package:martideas/gen/fonts.gen.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';
import 'package:martideas/utils/utils.dart';
import 'package:martideas/widgets/general_widgets/custom_button.dart';
import 'package:martideas/widgets/general_widgets/custom_textfield.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
final passwordToggleStateProvider = StateProvider<bool>((ref){
  return  false;
});
class LoginPage extends HookConsumerWidget {
  const LoginPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = screenSize(context);
    var passwordTextEditingController = useTextEditingController();
    var emailTextEditingController= useTextEditingController();
    return SafeArea(
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
                      Text("Login",style: TextStyle(
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
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp
                          ),),
                          SizedBox(height: 11.h,),
                          CustomTextField(textInputType: TextInputType.emailAddress, labelText: "Email Address", textFieldLabelStyle: TextStyle(
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
                          CustomTextField(textInputType: TextInputType.visiblePassword, labelText: "Enter Password",
                            textFieldLabelStyle:TextStyle(
                                color: Color(0xffB7B7B7),
                                fontFamily: FontFamily.mono,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp
                            ),textEditingController: passwordTextEditingController,isPassword:true,passwordTogglerState:passwordToggleStateProvider)
                        ],
                      ),
                      SizedBox(height: 77.h,),
                      CustomButton(buttonLabel: "Login", buttonLabelStyle:TextStyle(
                          color:Colors.white,
                          fontFamily: FontFamily.mono,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp
                      ), onButtonPressed:()async{
                        if(emailTextEditingController.text.isEmpty || passwordTextEditingController.text.isEmpty){
                          Fluttertoast.showToast(msg: "Fields Cannot be empty");
                          return;
                        }
                        final progress = ProgressHUD.of(context);
                        progress!.showWithText('Login User...');
                        Either<FirebaseAuthException,void> response =await ref.read(authRepositoryProvider).signInUser(registerRequestModel: RegisterRequestModel(email: emailTextEditingController.text.toString().trim(), password: passwordTextEditingController.text.toString().trim()));
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
                      SizedBox(height: 31.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 80.w,
                            height: 1.h,
                            color: const Color(0xff9F9E9E),
                          ),
                          SizedBox(width: 15.w,),
                          Text("Or",style: TextStyle(
                              color:const Color(0xff9F9E9E),
                              fontFamily: FontFamily.mono,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp
                          ),),
                          SizedBox(width: 15.w,),
                          Container(
                            width: 80.w,
                            height: 1.h,
                            color: const Color(0xff9F9E9E),
                          ),
                        ],
                      ),
                      SizedBox(height: 39.h,),
                      TextButton(onPressed: (){
                        context.router.navigate(const SignupRoute());
                      }, child: RichText(
                          text: TextSpan(
                              text: "Not a member? ",
                              style:TextStyle(
                                  color:const Color(0xff868686),
                                  fontFamily: FontFamily.mono,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.sp
                              ),
                              children: [
                                TextSpan(
                                  text: "Register",
                                  style:TextStyle(
                                      color:const Color(0xff136AFB),
                                      fontFamily: FontFamily.mono,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp
                                  ),
                                ),
                              ]))),
                      SizedBox(height: 39.h,),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
