import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slr_sharemap/models/db/database_manager.dart';
import 'package:slr_sharemap/models/location/location.manager.dart';
import 'package:slr_sharemap/models/repositories/user_repository.dart';
import 'package:slr_sharemap/utils/constants.dart';
import 'package:slr_sharemap/view_models/post_view_model.dart';

class PostRepository {
  final DatabaseManager dbManager;
  final LocationManager locationManager;

  PostRepository({required this.dbManager, required this.locationManager});

  Future<File?> pickImage(UploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == UploadType.GALLERY) {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      return (pickedImage != null) ? File(pickedImage.path) : null;
    } else {
      final pickedImage =
          await imagePicker.pickImage(source: ImageSource.camera);
      return (pickedImage != null) ? File(pickedImage.path) : null;
    }
  }

  Future getCurrentLocation() async {
    return await locationManager.getCurrentLocation();
  }
}
