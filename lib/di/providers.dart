import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> globalProvider = [
  ...independentModels,
  ...dependentModels,
  ...viewModels,
];

List<SingleChildWidget> independentModels = [];

List<SingleChildWidget> dependentModels = [];

List<SingleChildWidget> viewModels = [];
