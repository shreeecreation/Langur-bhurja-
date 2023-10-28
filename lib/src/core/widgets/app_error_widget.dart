import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({Key? key, required this.details}) : super(key: key);

  final FlutterErrorDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Flutter Error Screen ${details.exceptionAsString()}'),
      ),
    );
  }
}
