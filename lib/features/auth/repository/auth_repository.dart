import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_reddit_clone/core/common/firebase_constants.dart';
import 'package:flutter_reddit_clone/core/contants/constants.dart';
import 'package:flutter_reddit_clone/core/providers/firebase_providers.dart';
import 'package:flutter_reddit_clone/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestoreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  AuthRepository(
      {required FirebaseFirestore firestore,
      required FirebaseAuth auth,
      required GoogleSignIn googleSignIn})
      : _firestore = firestore,
        _auth = auth,
        _googleSignIn = googleSignIn;

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      UserModel userModel;
      if (userCredential.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          uid: userCredential.user!.uid,
          name: userCredential.user?.displayName ?? "No name",
          profilePicture:
              userCredential.user?.photoURL ?? Constants.avatarDefault,
          banner: Constants.bannerDefault,
          isAuthenticated: true,
          karma: 0,
          awards: [],
        );
        await _users.doc(userCredential.user!.uid).set(userModel.toMap());
      } else {
        userModel = await getUserData(userCredential.user!.uid).first;
      }
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  Stream<UserModel> getUserData(String uid) {
    return _users
        .doc(uid)
        .snapshots()
        .map((user) => UserModel.fromMap(user.data() as Map<String, dynamic>));
  }
}
