import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_reddit_clone/core/common/firebase_constants.dart';

class CommunityRepository {
  final FirebaseFirestore _firestore;

  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  CollectionReference get _communities =>
      _firestore.collection(FirebaseConstants.communitiesCollection);

  Future<void> createCommunity() async {
    try {} on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      rethrow;
    }
  }
}
