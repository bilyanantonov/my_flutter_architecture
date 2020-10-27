import 'package:flutter/material.dart';
import 'package:my_flutter_architecture/screens/landing_page.dart';
import 'package:my_flutter_architecture/utils/locator.dart';
import 'package:my_flutter_architecture/view_model/post_view_model.dart';
import 'package:my_flutter_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PostViewModel>(
            create: (context) => PostViewModel()),
        ChangeNotifierProvider<UserViewModel>(
            create: (context) => UserViewModel())
      ],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(primaryColor: Color.fromARGB(255, 62, 182, 226)),
        home: LandingPage(),
      ),
    );
  }
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider(
  //     create: (context) => PostViewModel(),
  //     child: MaterialApp(
  //         title: 'Flutter Demo', theme: ThemeData(), home: PostsPage()),
  //   );
  // }
}
