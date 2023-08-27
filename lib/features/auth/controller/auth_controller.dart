import 'package:flutter/material.dart';
import 'package:flutter_reddit_clone/core/utils.dart';
import 'package:flutter_reddit_clone/features/auth/repository/auth_repository.dart';
import 'package:flutter_reddit_clone/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider),
    ref: ref,
  ),
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  final Ref _ref;

  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  void signInWithGoogle(BuildContext context) async {
    try {
      state = true;
      final userModel = await _authRepository.signInWithGoogle();
      state = false;
      _ref.read(userProvider.notifier).update((state) => userModel);
      // do something
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
