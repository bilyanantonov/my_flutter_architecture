import 'package:my_flutter_architecture/model/user.dart';

abstract class AuthBase {
  Future<User> signIn(String email, String password);
}