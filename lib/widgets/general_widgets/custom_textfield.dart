import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextField extends HookConsumerWidget {
  final String labelText;
  final TextStyle textFieldLabelStyle;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final Color? textFieldFillColor,textfieldTextColor;
  final int?maxLength,maxLines;
  final double? lineHeight;
  final List<TextInputFormatter>? textInputFormatters;
  final TextInputAction? textInputAction;
  final Function(String)? onChangeFn;
  final Widget? prefixIcon;
  final double textFieldRadius;
  final StateProvider<bool>? passwordTogglerState;
  final bool isPassword;
  CustomTextField({ required this.textFieldLabelStyle,required this.textInputType,this.textFieldFillColor,
    this.textfieldTextColor,this.maxLength,this.maxLines,this.textInputFormatters,
    this.textInputAction,this.onChangeFn,this.lineHeight,this.textEditingController,this.prefixIcon,required this.labelText,this.textFieldRadius=5,this.passwordTogglerState,this.isPassword=false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return isPassword?Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        autofocus: false,
        inputFormatters: textInputFormatters,
        keyboardType:
        textInputType,
        obscureText: !ref.watch(passwordTogglerState!),
        textInputAction: textInputAction,
        controller: textEditingController,
        onChanged: (text){

        },
        style:Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w400,),
        decoration: InputDecoration(
            filled: true,
            fillColor: textFieldFillColor,
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle:textFieldLabelStyle,
            suffixIcon: IconButton(
              icon: Icon(
                ref.watch(passwordTogglerState!)
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: const Color(0xffA9ACB5),
                size: 24,
              ),
              onPressed: () {
                ref.read(passwordTogglerState!.notifier).state=!ref.watch(passwordTogglerState!);
              },
            ),
            hintText: "",
            contentPadding:
            const EdgeInsets.only(left: 24, bottom: 15, top: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffF6F6F6),width: 1),
              borderRadius: BorderRadius.circular(textFieldRadius),
            ),
            enabledBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF6F6F6),width: 1),
              borderRadius: BorderRadius.circular(textFieldRadius),
            )
        ),
      ),
    ):Theme(
      data: Theme.of(context).copyWith(splashColor: Colors.transparent),
      child: TextField(
        autofocus: false,
        maxLength:maxLength,
        maxLines:maxLines,
        inputFormatters: textInputFormatters,
        keyboardType:
        textInputType,
        obscureText: false,
        textInputAction: textInputAction,
        controller: textEditingController,
        onChanged: (text){

        },
        style:Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.w400,),
        decoration: InputDecoration(
            filled: true,
            fillColor: textFieldFillColor,
            prefixIcon: prefixIcon,
            labelText: labelText,
            labelStyle:textFieldLabelStyle,
            hintText: "",
            contentPadding:
            const EdgeInsets.only(left: 24, bottom: 15, top: 15),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: const Color(0xffF6F6F6),width: 1),
              borderRadius: BorderRadius.circular(textFieldRadius),
            ),
            enabledBorder:OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffF6F6F6),width: 1),
              borderRadius: BorderRadius.circular(textFieldRadius),
            )
        ),
      ),
    );
  }
}