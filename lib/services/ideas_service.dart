import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/service_injections.dart';
import 'package:martideas/extensions/firebase_extensions.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';
import 'package:martideas/models/ideas_model/ideas_like_model.dart';
import 'package:martideas/utils/utils.dart';

import '../state_managers/state_providers/ideasTabsStateProvider.dart';

class IdeasService{
  final Ref _read;
  const IdeasService(this._read);

  Future<Either<FirebaseException,void>> createIdeas({required CreateIdeaModel createIdeaModel}) async{
    try {
      await _read.read(firebaseFirestoreProvider).ideasCollectionRef().add(createIdeaModel);
      return right(None());
    } on FirebaseException catch (e) {
      return left(e);
    }
  }
  Future<Either<FirebaseException,void>> likeIdea({required IdeasLikeModel ideasLikeModel,required String ideaId}) async{
    try {
      if(ideasLikeModel.isLiked){
        await _read.read(firebaseFirestoreProvider).ideasLikeCollectionRef(ideaId).doc(ideasLikeModel.userId).set(ideasLikeModel,
            SetOptions(merge: true));
      }else{
        await _read.read(firebaseFirestoreProvider).ideasLikeCollectionRef(ideaId).doc(ideasLikeModel.userId).delete();
      }
      return right(None());
    } on FirebaseException catch (e) {
      return left(e);
    }
  }

  Stream<List<CreateIdeaModel>>ideasList(){
    return _read.read(firebaseFirestoreProvider).ideasCollectionRef().snapshots().map((event) => event.docs.map((e) => e.data().copyWith(ideaId: e.id)).toList());
  }
  Stream<List<IdeasLikeModel>>ideaLikedList(String ideaId){
    return _read.read(firebaseFirestoreProvider).ideasLikeCollectionRef(ideaId).snapshots().map((event) => event.docs.map((e) => e.data()).toList());
  }
}