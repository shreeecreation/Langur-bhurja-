import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:langurburja/src/core/widgets/adaptive_sizer_widget.dart';
import 'package:langurburja/src/features/normal_game/bloc/cubit/normal_game_cubit.dart';

import 'src/app/splash/presentation/pages/splash_page.dart';
import 'src/core/helpers/adaptive_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdaptiveHelper();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveSizer(builder: (context) {
      return BlocProvider(
        create: (context) => NormalGameCubit(),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          debugShowCheckedModeBanner: false,
          home: const SplashPage(),
        ),
      );
    });
  }
}
