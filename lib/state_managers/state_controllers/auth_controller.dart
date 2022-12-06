import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';

import '../../dependency_injection/repositories_injections.dart';


class AuthController extends StateNotifier<User?> {
  final Reader _read;

  StreamSubscription<User?>? _authStateChangesSubscription;

  AuthController(this._read) : super(null) {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }


  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }

  Future<Either<FirebaseAuthException,void>> loginUser({required RegisterRequestModel registerRequestModel})async{
    return await _read(authRepositoryProvider).signInUser(registerRequestModel: registerRequestModel);
  }

  Future<Either<FirebaseAuthException,void>> registerUser({required RegisterRequestModel registerRequestModel})async{
   return  await _read(authRepositoryProvider).registerUser(registerRequestModel: registerRequestModel);
  }

}
