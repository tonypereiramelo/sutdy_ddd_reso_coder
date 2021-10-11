import 'package:ddd_study/application/auth/auth_bloc.dart';
import 'package:ddd_study/injection.dart';
import 'package:ddd_study/presentation/sign_in/sign_in_page.dart';
import 'package:ddd_study/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AuthBloc>()
            ..add(
              const AuthEvent.authCheckRequested(),
            ),
        ),
      ],
      child: GetMaterialApp(
        initialRoute: "/",
        getPages: [
          GetPage(name: "/", page: () => const SplashPage()),
          GetPage(name: "/SignInPage", page: () => const SignInPage()),
        ],
        title: 'DDD Study',
        home: const SignInPage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          primaryColor: Colors.green[800],
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueAccent,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
