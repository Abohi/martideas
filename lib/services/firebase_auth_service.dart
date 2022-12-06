import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:martideas/models/auth_model/register_model/register_request_model.dart';

import '../dependency_injection/service_injections.dart';
import '../models/exception_models/custom_exception_model/custom_exception_model.dart';

class FirebaseAuthService{
  final Ref _read;
  const FirebaseAuthService(this._read);
  Future<Either<FirebaseAuthException,void>> registerUser({required RegisterRequestModel registerRequestModel}) async{
    try {
      await _read.read(firebaseAuthProvider).createUserWithEmailAndPassword(email: registerRequestModel.email, password:registerRequestModel.password );
      return right(None());
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
  }

  Future<Either<FirebaseAuthException,void>> signInUser({required RegisterRequestModel registerRequestModel}) async{
    try {
      await _read.read(firebaseAuthProvider).signInWithEmailAndPassword(email: registerRequestModel.email, password: registerRequestModel.password);
      return right(None());
    } on FirebaseAuthException catch (e) {
      return left(e);
    }
  }
  Future<void> signOut() async {
    try {
      await _read.read(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }
  User? getCurrentUser() {
    try {
      return _read.read(firebaseAuthProvider).currentUser;

    } on FirebaseAuthException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  Stream<User?> get authStateChanges =>
      _read.read(firebaseAuthProvider).authStateChanges();
}