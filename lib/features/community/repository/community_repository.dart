import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_reddit_clone/core/common/firebase_constants.dart';
import 'package:flutter_reddit_clone/core/providers/firebase_providers.dart';
import 'package:flutter_reddit_clone/models/community_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final communityRepositoryProvider = Provider(
  (ref) => CommunityRepository(
    firestore: ref.read(firestoreProvider),
  ),
);

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _communities =>
      _firestore.collection(FirebaseConstants.communitiesCollection);

  Future<void> createCommunity(Community community) async {
    try {
      final communityDoc = await _communities.doc(community.name).get();
      if (communityDoc.exists) {
        throw "Community with the same name already exists";
      }
      await _communities.doc(community.name).set(community.toMap());
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      rethrow;
    }
  }
}
