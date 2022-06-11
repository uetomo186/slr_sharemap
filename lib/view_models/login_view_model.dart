import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;
}
