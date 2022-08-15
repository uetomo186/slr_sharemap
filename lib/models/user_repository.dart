import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slr_sharemap/data_models/user.dart';
import 'package:slr_sharemap/models/db/database_manager.dart';

class UserRepository {
  final DatabaseManager dbManager;
  UserRepository({required this.dbManager});

  final auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<bool> isSingIn() async {
    final FirebaseUser = await _auth.currentUser();
    if (FirebaseUser != null) {
      return true;
    }
    return false;
  }

  Future<bool> signIn() async {
    try {
      GoogleSignInAccount? signInAccount = await _googleSignIn.signIn();
      if (signInAccount == null) return false;
      GoogleSignInAuthentication signInAuthentication =
          await signInAccount.authentication;
      final auth.AuthCredential credential = auth.GoogleAuthProvider.credential(
        idToken: signInAuthentication.idToken,
        accessToken: signInAuthentication.accessToken,
      );

      final firebaseUser = (await _auth.signInWithCredential(credential)).user;
      if (firebaseUser == null) {
        return false;
      }
    } catch (error) {}

    // Databaseに登録
    final isUserExistedInDb = await dbManager.searchUserInDb(firebaseUser);
    if (!isUserExistedInDb) {
      await dbManager.insertUser(_convertToUser(firebaseUser));
    }
  }

  _convertToUser(auth.User firebaseUser) {
    return User(
        userId: firebaseUser.uid,
        displayName: firebaseUser.displayName ?? "",
        inAppUserName: firebaseUser.displayName ?? "",
        photoUrl: firebaseUser.photoURL ?? "",
        email: firebaseUser.email ?? "",
        bio: "");
  }
}
