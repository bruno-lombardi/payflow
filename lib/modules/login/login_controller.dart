import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future<void> handleGoogleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      if (response != null) {
        final user = UserModel(
            name: response.displayName!, photoUrl: response.photoUrl!);
        await authController.setUser(context, user);
      }
    } catch (error) {
      print(error);
      authController.setUser(context, null);
    }
  }
}
