import 'package:flutter/material.dart';
import 'package:mvvm_test/model_view/postView-modle.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = context.watch<PostViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text(postViewModel.postItem.title!.toString()),),
      body: Container(child: Text(postViewModel.postItem.body!),),
    );
  }
}