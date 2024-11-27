import 'package:eommerce_app/model/user/user.dart';
import 'package:eommerce_app/services/local/local_service.dart';
import 'package:eommerce_app/services/remote/auth/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final authProvider = StateNotifierProvider<AuthNotifier, User?>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<User?> {
  AuthNotifier() : super(null);

  Future<User?> getUser() async {
    var user = await LocalService.getUser();
    if (user != null) setUser(user);
    return user;
  }

  setUser(User newUser) {
    state = newUser;
  }

  Future<void> signInWithGoogle() async {
    try {
      User user = await AuthService.signInWithGoogle();
      await LocalService.saveUser(user);
      setUser(user);
    } catch (e) {
      Fluttertoast.showToast(msg: '$e');
    }
  }

  Future<void> signOut() async {
    await AuthService.signOut();
    await LocalService.removeUser();
  }
}
