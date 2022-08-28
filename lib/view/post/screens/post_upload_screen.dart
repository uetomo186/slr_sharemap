import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:slr_sharemap/utils/constants.dart';
import 'package:slr_sharemap/view_models/post_view_model.dart';

class PostUploadScreen extends StatelessWidget {
  final UploadType uploadType;
  PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
    //TODO [provider4.1.0] Provider.of(listen: false) => context.read()
    Future(() {
      final postViewModel = context.read<PostViewModel>();
      if (!postViewModel.isImagePicked && !postViewModel.isProcessing) {
        postViewModel.pickImage(uploadType);
      }
    });

    return Scaffold(
      body: Container(),
    );
  }
}
