import 'package:flutter/material.dart';

import '../../core/extensions/string/util_extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('template'.translate),
        ),
        body: Center(
          child: FlutterLogo(
            size: 200,
          ),
        ));
  }
}
