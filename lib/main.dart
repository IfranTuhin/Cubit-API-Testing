import 'dart:math';

import 'package:api_handling_3/Data/Models/post_model.dart';
import 'package:api_handling_3/Data/Repositories/post_repository.dart';
import 'package:api_handling_3/Logic/Cubits/post_cubit.dart';
import 'package:api_handling_3/Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => PostCubit(),
        child: HomeScreen(),
      ),
    );
  }
}
