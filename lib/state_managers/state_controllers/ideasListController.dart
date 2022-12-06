import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';

import '../../dependency_injection/repositories_injections.dart';


class IdeasListController extends StateNotifier<List<CreateIdeaModel>?> {
  final Reader _read;

  StreamSubscription<List<CreateIdeaModel>?>? _ideaListSubscription;

  IdeasListController(this._read) : super(null) {
    _ideaListSubscription?.cancel();
    _ideaListSubscription = _read(ideasRepositoryProvider)
        .ideaList()
        .listen((ideaList) => state = ideaList);
  }

  @override
  void dispose() {
    _ideaListSubscription?.cancel();
    super.dispose();
  }


}
