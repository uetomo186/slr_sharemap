import 'package:flutter/material.dart';
import 'package:slr_sharemap/models/repositories/post_repository.dart';
import 'package:slr_sharemap/models/repositories/user_repository.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  bool isProcessing = false;
  bool isImagePicked = false;

  PostViewModel({
    required this.userRepository,
    required this.postRepository,
  });
}
