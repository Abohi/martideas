import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/dependency_injection/service_injections.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';

import '../models/exception_models/custom_exception_model/custom_exception_model.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges;
  Future<Either<FirebaseAuthException,void>> signInUser({required RegisterRequestModel registerRequestModel});
  Future<Either<FirebaseAuthException,void>> registerUser({required RegisterRequestModel registerRequestModel});
  Future<void> signOut();
}

class AuthRepository implements BaseAuthRepository {
  final Ref _read;

  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges =>
      _read.read(firebaseAuthServiceProvider).authStateChanges;


  @override
  User? getCurrentUser() {
    try {
      return _read.read(firebaseAuthServiceProvider).getCurrentUser();

    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _read.read(firebaseAuthServiceProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<Either<FirebaseAuthException,void>> registerUser({required RegisterRequestModel registerRequestModel})async{
    return await _read.read(firebaseAuthServiceProvider).registerUser(registerRequestModel: registerRequestModel);
  }

  @override
  Future<Either<FirebaseAuthException,void>> signInUser({required RegisterRequestModel registerRequestModel})async{
    return await _read.read(firebaseAuthServiceProvider).signInUser(registerRequestModel: registerRequestModel);
  }



}