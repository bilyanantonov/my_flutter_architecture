import 'package:flutter/material.dart';
import 'package:my_flutter_architecture/model/post.dart';
import 'package:my_flutter_architecture/repository/repository.dart';
import 'package:my_flutter_architecture/utils/locator.dart';

enum PostViewState { Idle, Busy, Loaded, NoPost }

class PostViewModel with ChangeNotifier {
  PostViewState _state = PostViewState.Idle;
  Repository _postRepository = locator<Repository>();
  PostViewState get state => _state;
  set state(PostViewState value) {
    _state = value;
    notifyListeners();
  }

  List<Post> _postList;
  List<Post> get postList => _postList;

  PostViewModel() {
    _postList = [];
    getPosts();
  }

  void getPosts() async {
    try {
      state = PostViewState.Busy;
      List<Post> _posts = await _postRepository.getPosts();
      if (_posts.length > 0) {
        state = PostViewState.Loaded;
        postList.addAll(_posts);
      } else {
        state = PostViewState.NoPost;
      }
    } catch (e) {}
  }
}
