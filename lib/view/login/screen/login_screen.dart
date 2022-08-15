import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:slr_sharemap/generated/l10n.dart';
import 'package:slr_sharemap/view/common/components/button_with_icon.dart';
import 'package:slr_sharemap/view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(S.of(context).appTitle),
            SizedBox(
              height: 8.0,
            ),
            ButtonWithIcon(
              iconData: FontAwesomeIcons.arrowRightFromBracket,
              label: S.of(context).signIn,
              onPressed: () => login(context),
            ),
          ],
        ),
      ),
    );
  }

  login(BuildContext context) async {
    final LoginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    await LoginViewModel.signIn();
  }
}
