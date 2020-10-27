import 'package:my_flutter_architecture/model/post.dart';
import 'package:my_flutter_architecture/services/abstract/db_base.dart';

class DbService implements DbBase {
  @override
  Future<List<Post>> getPosts() async {
    List<Post> posts = [];
    posts.add(Post(
        id: "1", name: "Ercan abi nabıyosun &:)", imageUrl: "https://via.placeholder.com/150"));
    posts.add(Post(
        id: "2", name: "Beycan", imageUrl: "https://via.placeholder.com/150"));
    posts.add(Post(
        id: "3", name: "Cancan", imageUrl: "https://via.placeholder.com/150"));
    return await Future.delayed(Duration(seconds: 1), () => posts);
  }
}
