import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/feature/auth/ui/login_screen.dart';
import 'package:movie_app/feature/auth/ui/register_screen.dart';
import 'package:movie_app/feature/google_navbar.dart';
import 'package:movie_app/repositories/auth_repository.dart';

import 'feature/auth/bloc/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: context.read<AuthRepository>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              // primarySwatch: Colors.blue,
              brightness: Brightness.dark,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  centerTitle: true,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ))),
          // darkTheme: ThemeData(
          //   brightness: Brightness.dark,
          //   scaffoldBackgroundColor: Colors.black,
          // ),
          home: RegisterScreen(),
          // home: GNavBar(),
        ),
      ),
    );
  }
}
