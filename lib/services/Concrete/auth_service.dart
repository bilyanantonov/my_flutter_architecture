import 'package:my_flutter_architecture/model/user.dart';
import 'package:my_flutter_architecture/services/abstract/autth_base.dart';

class AuthService implements AuthBase {
  @override
  Future<User> signIn(String email,String password) async {
    return await Future.delayed(Duration(seconds: 3),
        () => User(userId: "1", userName: "Ercan", email: "ercan@ercan.com"));
    // return await Future.delayed(Duration(seconds: 3),
    //     () => null);
  }
}