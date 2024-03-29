import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:slr_sharemap/models/db/database_manager.dart';
import 'package:slr_sharemap/models/location/location.manager.dart';
import 'package:slr_sharemap/models/repositories/post_repository.dart';
import 'package:slr_sharemap/models/repositories/user_repository.dart';
import 'package:slr_sharemap/view_models/login_view_model.dart';
import 'package:slr_sharemap/view_models/post_view_model.dart';

List<SingleChildWidget> globalProviders = [
  ...independentModels,
  ...dependentModels,
  ...viewModels
];

List<SingleChildWidget> independentModels = [
  Provider<DatabaseManager>(
    create: (_) => DatabaseManager(),
  ),
  Provider<LocationManager>(create: (_) => LocationManager()),
];

List<SingleChildWidget> dependentModels = [
  ProxyProvider2<DatabaseManager, LocationManager, UserRepository>(
    update: (_, dbManager, LocationManager, repo) =>
        UserRepository(dbManager: dbManager),
  ),
];

List<SingleChildWidget> viewModels = [
  ChangeNotifierProvider<LoginViewModel>(
    create: (context) => LoginViewModel(
        //userRepository: Provider.of<UserRepository>(context, listen: false)
        userRepository: context.read<UserRepository>()),
  ),
  ChangeNotifierProvider<PostViewModel>(
    create: (context) => PostViewModel(
      userRepository: Provider.of<UserRepository>(context, listen: false),
      postRepository: Provider.of<PostRepository>(context, listen: false),
    ),
  ),
];
