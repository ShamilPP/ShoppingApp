import 'package:eommerce_app/constants/google_key.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../model/user/user.dart' as myUser;

class AuthService {
  static final supabase = Supabase.instance.client;

  static Future<myUser.User> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn(serverClientId: GoogleKey.CLIENT_ID).signIn();
    if (googleSignInAccount == null) {
      throw 'Google authentication failed.';
    }
    final GoogleSignInAuthentication authentication = await googleSignInAccount.authentication;

    if (authentication.accessToken == null) {
      throw 'No Access Token found.';
    }
    if (authentication.idToken == null) {
      throw 'No ID Token found.';
    }

    AuthResponse response =
        await supabase.auth.signInWithIdToken(provider: OAuthProvider.google, idToken: authentication.idToken!, accessToken: authentication.accessToken);
    User? user = response.user;
    if (user == null) {
      throw 'No User found.';
    }
    var usr = myUser.User(id: user.id, name: user.userMetadata!['full_name'], email: user.email!);
    return usr;
  }

  static Future<bool> signOut() async {
    await supabase.auth.signOut();
    return true;
  }
}
