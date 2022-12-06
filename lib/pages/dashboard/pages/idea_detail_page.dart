import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/controllers_injections.dart';
import 'package:martideas/dependency_injection/repositories_injections.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';
import 'package:martideas/models/ideas_model/ideas_like_model.dart';
import 'package:martideas/utils/utils.dart';

import '../../../gen/fonts.gen.dart';
import '../../../state_managers/state_providers/isLikeStateProvider.dart';
import '../../../widgets/general_widgets/custom_appbar.dart';
import '../../../widgets/general_widgets/custom_bar_arrow.dart';

class IdeaDetailPage extends HookConsumerWidget {
  final CreateIdeaModel createIdeaModel;
  const IdeaDetailPage({required this.createIdeaModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var size = screenSize(context);
    var numLike = useState<int?>(null);
    numLike.value=ref.watch(ideaLikeListControllerProvider)?.length;
    useEffect((){
      Future.microtask((){
        ref.watch(ideaLikeListControllerProvider)?.forEach((element) {
          if(element.userId==ref.read(authControllerProvider)!.uid){
            ref.read(isLikedStateProvider.notifier).state=true;
          }else{
            ref.read(isLikedStateProvider.notifier).state=false;
          }
        });
      });
      return null;
    },[ref.watch(ideaLikeListControllerProvider)]);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: SizedBox.shrink(),
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomBackArrow(onButtonPressed: (){
              context.popRoute();
            },),
          ), appBarColor: Colors.white,elavation: 0,),
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width,
                height: 100.h,
                child: Card(
                  color: Color(createIdeaModel.categoryColor),
                  child:Center(
                    child: Text(createIdeaModel.categoryName.toUpperCase(),style: TextStyle(
                        color: Color(0xff333333),
                        fontFamily: FontFamily.mono,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.sp
                    ),),
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Text("Title",style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: FontFamily.mono,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp
              ),),
              SizedBox(height: 2.h,),
              Text(createIdeaModel.title,style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: FontFamily.mono,
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp
              ),),
              SizedBox(height: 15.h,),
              Text("Description",style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: FontFamily.mono,
                  fontWeight: FontWeight.w400,
                  fontSize: 13.sp
              ),),
              SizedBox(height: 2.h,),
              Text(createIdeaModel.description,style: TextStyle(
                  color: Color(0xff333333),
                  fontFamily: FontFamily.mono,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(numLike.value==null?"":numLike.value.toString(),style: TextStyle(
                      color: Color(0xff333333),
                      fontFamily: FontFamily.mono,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp
                  ),),
                  SizedBox(width: 5.w,),
                  IconButton(onPressed: ()async{
                    ref.read(isLikedStateProvider.notifier).state=!ref.watch(isLikedStateProvider);
                    ref.read(ideasRepositoryProvider).likeIdea(ideasLikeModel: IdeasLikeModel(isLiked:ref.read(isLikedStateProvider.notifier).state, userId: ref.read(authControllerProvider)!.uid),
                        ideaId: createIdeaModel.ideaId!);
                    numLike.value=ref.watch(ideaLikeListControllerProvider)?.length;
                  }, icon: Icon(Icons.thumb_up,color: ref.watch(isLikedStateProvider)?const Color(0xff4EA8FB):Colors.black.withOpacity(0.4),)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
