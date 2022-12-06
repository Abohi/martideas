import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final bool centerTitle;
  final double height;
  final double? elavation;
  final List<Widget>?actionsWidget;
  final Color appBarColor;
  const CustomAppBar({required this.title,this.leading,this.centerTitle=false,this.height=kToolbarHeight,this.actionsWidget,required this.appBarColor,this.elavation=0});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: elavation,
      backgroundColor: appBarColor,
      title: title,
      centerTitle:centerTitle,
      leading: leading,
      actions: actionsWidget,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
