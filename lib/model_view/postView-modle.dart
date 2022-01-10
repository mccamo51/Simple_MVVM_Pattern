// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mvvm_test/model/postModel.dart';
import 'package:mvvm_test/services/api_status.dart';
import 'package:mvvm_test/services/serverOperation.dart';

class PostViewModel extends ChangeNotifier {
  bool _isLoading = false;
  List<PostModel> _postList = [];
  PostModel _postModel = PostModel();
  PostError _postError = PostError();

  bool get loading => _isLoading;
  List<PostModel> get postList => _postList;
  PostError get postError => _postError;
  PostModel get postItem => _postModel;

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

  setPostItem(PostModel postModel){
    _postModel = postModel;
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

  // getDetails(String id)async{
  //   var response = await PostService.getPostDetails(id);
  //   if(response is Success){
  //     setPostItem(response.response);
  //   }
  // }
}
