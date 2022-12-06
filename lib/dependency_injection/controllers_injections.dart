import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/models/ideas_model/create_ideas_model.dart';
import 'package:martideas/models/ideas_model/ideas_like_model.dart';

import '../state_managers/state_controllers/auth_controller.dart';
import '../state_managers/state_controllers/ideasLikedController.dart';
import '../state_managers/state_controllers/ideasListController.dart';

final authControllerProvider = StateNotifierProvider<AuthController, User?>(
      (ref) => AuthController(ref.read),
);
final ideaListControllerProvider = StateNotifierProvider<IdeasListController, List<CreateIdeaModel>?>(
      (ref) => IdeasListController(ref.read),
);
final ideaLikeListControllerProvider = StateNotifierProvider<IdeaLikeListController, List<IdeasLikeModel>?>(
      (ref) => IdeaLikeListController(ref.read),
);