import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';
import 'package:martideas/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../gen/fonts.gen.dart';

class IdeasListItem extends StatelessWidget {
  final CreateIdeaModel createIdeaModel;
  final Function onButtonPressed;
  const IdeasListItem({required this.createIdeaModel,required this.onButtonPressed});

  @override
  Widget build(BuildContext context) {
    var size= screenSize(context);
    return GestureDetector(
      onTap: (){
        onButtonPressed();
    },
      child: Container(
        width: size.width,
        margin: EdgeInsets.only(bottom: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 22.w,
              height: 22.h,
              decoration: BoxDecoration(
                color:Color(createIdeaModel.categoryColor),
                shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 10.w,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(createIdeaModel.title,style: TextStyle(
                    color: Color(0xff333333),
                    fontFamily: FontFamily.mono,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp
                ),),
                SizedBox(height: 4.h,),
                Text(timeago.format(createIdeaModel.ideaCreatedTime!),style: TextStyle(
                    color: Color(0xffB7B7B7),
                    fontFamily: FontFamily.mono,
                    fontWeight: FontWeight.w500,
                    fontSize: 13.sp
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
