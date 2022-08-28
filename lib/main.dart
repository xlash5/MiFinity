import 'package:flutter/material.dart';
import './router/routes.gr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './bloc/cubit/dice_cubit.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<DiceCubit>(
          create: (context) => DiceCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xff781C68),
        primaryColorLight: const Color(0xffFFD39A),
        primaryColor: const Color(0xff319DA0),
        canvasColor: const Color(0xffFFF5E1),
        appBarTheme: const AppBarTheme(
          color: Color(0xffFFD39A),
          titleTextStyle: TextStyle(
            color: Color.fromARGB(255, 60, 60, 60),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
