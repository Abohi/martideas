import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/service_injections.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';

import '../models/exception_models/custom_exception_model/custom_exception_model.dart';
import '../models/ideas_model/ideas_like_model.dart';

abstract class BaseIdeasRepository {
  Future<Either<FirebaseException,void>> createIdeas({required CreateIdeaModel createIdeaModel});
  Stream<List<CreateIdeaModel>>ideaList();
  Future<Either<FirebaseException,void>> likeIdea({required IdeasLikeModel ideasLikeModel,required String ideaId});
  Stream<List<IdeasLikeModel>> ideaLikeList(String ideaId);
}

class IdeasRepository implements BaseIdeasRepository {
  final Ref _read;

  const IdeasRepository(this._read);

  @override
  Future<Either<FirebaseException, void>> createIdeas({required CreateIdeaModel createIdeaModel}) async{
    return await _read.read(ideasServiceProvider).createIdeas(createIdeaModel: createIdeaModel);
  }

  @override
  Stream<List<CreateIdeaModel>> ideaList() {
    return _read.read(ideasServiceProvider).ideasList();
  }

  @override
  Future<Either<FirebaseException, void>> likeIdea({required IdeasLikeModel ideasLikeModel, required String ideaId})async{
    return await _read.read(ideasServiceProvider).likeIdea(ideasLikeModel: ideasLikeModel, ideaId: ideaId);
  }

  @override
  Stream<List<IdeasLikeModel>> ideaLikeList(String ideaId) {
    return _read.read(ideasServiceProvider).ideaLikedList(ideaId);
  }
}