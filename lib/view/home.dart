import 'package:flutter/material.dart';
import 'package:mvvm_test/model_view/postView-modle.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostViewModel postViewModel = context.watch<PostViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Task"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(
        children: [_ui(postViewModel)],
      ),
    );
  }
}

_ui(PostViewModel viewModel) {
  if (viewModel.loading) {
    return CircularProgressIndicator();
  }
  if (viewModel.postError.response != null) {
    return Text(viewModel.postError.response.toString());
  }
  // if (viewModel.postList != null) {
  return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  viewModel.postList[index].title!,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(viewModel.postList[index].body!)
              ],
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: viewModel.postList.length));
  // }
}
