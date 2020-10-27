import 'package:flutter/material.dart';
import 'package:my_flutter_architecture/model/user.dart';
import 'package:my_flutter_architecture/utils/locator.dart';
import 'package:my_flutter_architecture/repository/repository.dart';

enum ViewState { Idle, Busy, SignedIn }

class UserViewModel with ChangeNotifier {
  Repository _repository = locator<Repository>();
  User _user;
  get user => _user;

  ViewState _state = ViewState.Idle;
  get state => _state;
  set state(ViewState value) {
    _state = value;
    notifyListeners();
  }

  UserViewModel() {
    checkUser();
  }

  Future<User> checkUser() async {
    //Burayı sharedprefe bağlayacağım
    try {
      state = ViewState.Busy;
      _user = await _repository.getUserFromSharedPref();
      // _user = await Future.delayed(Duration(seconds: 3),
      //     () => User(userId: "1", userName: "Ercan", email: "ercan@ercan.com"));
      if (_user != null) {
        state = ViewState.SignedIn;
        return _user;
      } else {
        state = ViewState.Idle;
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User> signIn(String email, String password) async {
    try {
      state = ViewState.Busy;
      _user = await _repository.signIn(email, password);
      if (_user != null) {
        state = ViewState.SignedIn;
        return _user;
      } else {
        state = ViewState.Idle;
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      bool result = await _repository.deleteUserFromSharedPref();
      if (result) {
        state = ViewState.Idle;
      }else{

      }
    } catch (e) {}
  }
}
