import 'package:bloc_pattern_mvp/src/blocs/course_bloc/course_bloc.dart';
import 'package:bloc_pattern_mvp/src/blocs/course_bloc/course_event.dart';
import 'package:bloc_pattern_mvp/src/blocs/internet_bloc/internet_bloc.dart';
import 'package:bloc_pattern_mvp/src/data/network_service.dart';
import 'package:bloc_pattern_mvp/src/modules/home/home_screen.dart';
import 'package:bloc_pattern_mvp/src/modules/product_home/product_home.dart';
import 'package:bloc_pattern_mvp/src/repositry/course_repositry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final NetworkService networkService = NetworkService();
    final CourseRepository courseRepository = CourseRepository(networkService: networkService);
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(),
        ),
        BlocProvider<CourseBloc>(
          create: (context) => CourseBloc(repository: courseRepository)..add(FetchCoursesEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const ProductHome(),
      ),
    );
  }
}

