import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';
import 'package:martideas/models/ideas_model/ideas_like_model.dart';

import '../../dependency_injection/repositories_injections.dart';
import '../state_providers/ideaLikedIdStateProvider.dart';


class IdeaLikeListController extends StateNotifier<List<IdeasLikeModel>?> {
  final Reader _read;

  StreamSubscription<List<IdeasLikeModel>?>? _ideasLikedSubscription;

  IdeaLikeListController(this._read) : super(null) {
    _ideasLikedSubscription?.cancel();
    _ideasLikedSubscription = _read(ideasRepositoryProvider)
        .ideaLikeList(_read(ideasIdStateProvider))
        .listen((ideaList) => state = ideaList);
  }

  @override
  void dispose() {
    _ideasLikedSubscription?.cancel();
    super.dispose();
  }


}
