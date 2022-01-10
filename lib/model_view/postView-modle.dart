import 'package:flutter/material.dart';
import 'package:mvvm_test/model/postModel.dart';
import 'package:mvvm_test/services/api_status.dart';
import 'package:mvvm_test/services/serverOperation.dart';

class PostViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<PostModel> _postList = [];
  PostError _postError = PostError();

  bool get loading => _isLoading;
  List<PostModel> get postList => _postList;
  PostError get postError => _postError;

  PostViewModel() {
    getPost();
  }

  setLoading(bool isLoading) async {
    _isLoading = isLoading;
    notifyListeners();
  }

  setPostList(List<PostModel> list) {
    _postList = list;
  }

  setPostError(PostError postError) {
    _postError = postError;
  }

  getPost() async {
    setLoading(true);
    var response = await PostService.getPost();
    if (response is Success) {
      // print(response.response);
      setPostList(response.response as List<PostModel>);
    }
    if (response is Failed) {
      PostError postError = PostError(response: response.toString(), code: 111);
      setPostError(postError);
    }
    setLoading(false);
  }
}
