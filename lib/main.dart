import 'package:assessment_project/data/network/UserRepositoryImpl.dart';
import 'package:assessment_project/ui/Home.dart';
import 'package:assessment_project/ui/HomeViewModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

import 'data/database/AppDatabase.dart';
import 'data/database/UserRepositoryImpl.dart';
import 'data/database/UserTable.dart';
import 'data/network/UsersApi.dart';

void main() {
  final dio = Dio();
  final usersApi = UsersApi(dio);
  final db = AppDatabase();

  final userRepo = UserRepositoryImpl(userTable: UserTable(appDatabase: db));

  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(remoteUserRepo: RemoteUserRepositoryImpl(usersApi: usersApi), localUserRepo: userRepo),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

