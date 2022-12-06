import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/services/firebase_auth_service.dart';

import '../services/ideas_service.dart';

final firebaseAuthProvider =
Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final firebaseFirestoreProvider =
Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);
final firebaseAuthServiceProvider =
Provider<FirebaseAuthService>((ref) => FirebaseAuthService(ref));

final ideasServiceProvider =
Provider<IdeasService>((ref) => IdeasService(ref));
