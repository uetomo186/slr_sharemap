import 'dart:html';

import 'package:flutter/material.dart';
import 'package:slr_sharemap/generated/l10n.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text(S.of(context).appTitle)],
        ),
      ),
    );
  }
}
