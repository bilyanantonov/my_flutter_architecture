import 'dart:convert';

import 'package:my_flutter_architecture/model/post.dart';
import 'package:my_flutter_architecture/model/user.dart';
import 'package:my_flutter_architecture/services/abstract/autth_base.dart';
import 'package:my_flutter_architecture/services/abstract/db_base.dart';
import 'package:my_flutter_architecture/services/concrete/auth_service.dart';
import 'package:my_flutter_architecture/services/concrete/db_service.dart';
import 'package:my_flutter_architecture/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppMode { Debug, Release }

class Repository implements DbBase, AuthBase {
  AppMode appMode = AppMode.Debug;
  DbService _dbService = locator<DbService>();
  AuthService _authService = locator<AuthService>();
  @override
  Future<List<Post>> getPosts() async {
    if (appMode == AppMode.Debug) {
      return await _dbService.getPosts();
    } else {
      return null;
    }
  }

  @override
  Future<User> signIn(String email, String password) async {
    if (appMode == AppMode.Debug) {
      User _user = await _authService.signIn(email,password);
      if (_user != null) {
        await saveUserToSharedPref(_user);
        return _user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<bool> saveUserToSharedPref(User user) async {
    String _user = jsonEncode(user.toMap());
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', _user);
  }

  Future<bool> deleteUserFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('user');
  }

  Future<User> getUserFromSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _jsonUser = prefs.getString('user');
    if (_jsonUser != null) {
      return User.fromMap(jsonDecode(_jsonUser));
    } else {
      return null;
    }
  }
}
