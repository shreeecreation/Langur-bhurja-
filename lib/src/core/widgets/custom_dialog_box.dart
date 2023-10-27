import 'package:flutter/material.dart';


Future<T?> showCustomDialog<T>(
  BuildContext context,
  Widget child,
) async {
  return showDialog<T?>(
    context: context,
    builder: (context) => child,
    barrierDismissible: false,
    
  );
}
