
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/models/ideas_model/ideas_tab_model.dart';

import '../state_managers/state_providers/ideasTabsStateProvider.dart';

Size screenSize(BuildContext context){
  return MediaQuery.of(context).size;
}
IdeasTabModel getSelectedIdeasTab(WidgetRef read){
  if(read.watch(isFirstTabStateProvider)){
    return IdeasTabModel(title: "Commerce", color:const Color(0xffFB4EB6).value);
  }else if(read.watch(isSecondTabStateProvider)){
    return IdeasTabModel(title: "Tech", color:const Color(0xffC19AF8).value);
  }else if(read.watch(isThirdTabStateProvider)){
    return IdeasTabModel(title: "Science", color:const Color(0xffEFA363).value);
  }else if (read.watch(isForthTabStateProvider)){
    return IdeasTabModel(title: "Farming", color:const Color(0xffA7F6AA).value);
  }else{
    return IdeasTabModel(title: "Others", color:const Color(0xff6C7AF2).value);
  }
}