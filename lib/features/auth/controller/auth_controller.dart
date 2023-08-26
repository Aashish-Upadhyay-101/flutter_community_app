import 'package:flutter_reddit_clone/features/auth/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider(
  (ref) => AuthController(
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class AuthController {
  final AuthRepository _authRepository;

  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle() {
    try {
      final user = _authRepository.signInWithGoogle();
      // do something
    } catch (e) {
      // show snackbar error
    }
  }
}