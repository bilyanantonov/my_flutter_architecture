import 'package:my_flutter_architecture/model/post.dart';

abstract class DbBase {
  Future<List<Post>> getPosts();
}
