import 'package:flutter/material.dart';
import 'package:my_flutter_architecture/view_model/post_view_model.dart';
import 'package:my_flutter_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    // PostViewModel _postViewModel = Provider.of<PostViewModel>(context);
    UserViewModel _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts", style: TextStyle(color: Colors.white)),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color>[Color(0xff94e7e1), Color(0xff3eb6e2)])),
          ),
          actions: <Widget>[
            RaisedButton(
              onPressed: () {
                _userViewModel.signOut();
              },
              child: Text("Sign Out"),
            )
          ],
        ),
        body: Center(
          child: Consumer<PostViewModel>(builder: (context, postModel, child) {
            if (postModel.state == PostViewState.Loaded) {
              return Center(
                child: ListView.builder(
                    itemCount: postModel.postList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text(_filterString(postModel.postList[index].name)),
                      );
                    }),
              );
            } else if (postModel.state == PostViewState.Busy) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (postModel.state == PostViewState.NoPost) {
              return Center(child: Text("No Post"));
            } else {
              return Center();
            }
          }),
        ));
  }

  String _filterString(String postName) {
    var _newPostName = [];
    var _postNameArray = postName.split(" ");
    _postNameArray.forEach((p) {
      if (p == "&:)") {
        _newPostName.add(":)");
        _newPostName.add(" ");
      } else {
        _newPostName.add(p);
        _newPostName.add(" ");
      }
    });

    return _newPostName.join();
  }
}
