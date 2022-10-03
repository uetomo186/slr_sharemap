import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slr_sharemap/models/repositories/post_repository.dart';
import 'package:slr_sharemap/models/repositories/user_repository.dart';
import 'package:slr_sharemap/utils/constants.dart';

class PostViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  final PostRepository postRepository;

  File? imageFile;

  Location? location;
  String locationString = "";

  bool isProcessing = false;
  bool isImagePicked = false;

  PostViewModel({
    required this.userRepository,
    required this.postRepository,
  });

  Future<void> pickImage(UploadType uploadType) async {
    isImagePicked = false;
    isProcessing = false;
    notifyListeners();

    imageFile = (await postRepository.pickImage(uploadType)) as File?;

    location = await postRepository.getCurrentLocation();

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();
  }
}
