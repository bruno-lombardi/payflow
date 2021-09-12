import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  var _isAuthenticated = false;
  UserModel? _user;

  get user => _user;

  Future<void> setUser(BuildContext context, UserModel? user) async {
    if (user != null) {
      _user = user;
      _isAuthenticated = true;
      await saveUser(user);
      Navigator.pushReplacementNamed(context, "/home");
    } else {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJSON());
  }

  Future<void> clearUser() async {
    final instance = await SharedPreferences.getInstance();
    await instance.remove("user");
  }

  Future<void> loadCurrentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    if (instance.containsKey("user")) {
      final json = instance.get("user") as String;
      final user = UserModel.fromJSON(json);
      setUser(context, user);
    } else {
      setUser(context, null);
    }
  }
}
