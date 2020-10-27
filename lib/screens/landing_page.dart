import 'package:flutter/material.dart';
import 'package:my_flutter_architecture/screens/posts_page.dart';
import 'package:my_flutter_architecture/screens/sign_in_page.dart';
import 'package:my_flutter_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    if (_userViewModel.state == ViewState.SignedIn) {
      return PostsPage();
    } else if (_userViewModel.state == ViewState.Idle) {
      return SignInPage();
    } else {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
  }
}
