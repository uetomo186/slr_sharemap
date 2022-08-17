import 'package:flutter/material.dart';
import 'package:slr_sharemap/generated/l10n.dart';
import 'package:slr_sharemap/view/activities/page/activities_page.dart';
import 'package:slr_sharemap/view/feed/pages/feed_page.dart';
import 'package:slr_sharemap/view/post/page/post_page.dart';
import 'package:slr_sharemap/view/profile/pages/profile_page.dart';
import 'package:slr_sharemap/view/search/pages/search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _pages = [];
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [
      FeedPage(),
      SearchPage(),
      PostPage(),
      ActivitiesPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(S.of(context).appTitle),
      ),
    );
  }
}
