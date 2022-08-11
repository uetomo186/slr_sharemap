import 'package:flutter/material.dart';
import 'package:slr_sharemap/models/db/database_manager.dart';
import 'package:slr_sharemap/models/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;
}
