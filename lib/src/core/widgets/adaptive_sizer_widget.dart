import 'package:flutter/material.dart';
import 'package:langurburja/src/core/helpers/adaptive_helper.dart';

class AdaptiveSizer extends StatelessWidget {
  const AdaptiveSizer({
    super.key,
    required this.builder,
    this.designSize = AdaptiveHelper.defaultSize,
  });

  final Widget Function(BuildContext) builder;
  final Size designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      AdaptiveHelper.init(constraints: constraints, designSize: designSize);
      return builder(context);
    });
  }
}
