import 'package:blocprovider_clean_coding/config/routes/routes_name.dart';
import 'package:blocprovider_clean_coding/repository/auth/login_http_api_repository.dart';
import 'package:blocprovider_clean_coding/repository/auth/login_repository.dart';
import 'package:blocprovider_clean_coding/repository/movies/movies_http_api_repository.dart';
import 'package:blocprovider_clean_coding/repository/movies/movies_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'config/routes/routes.dart';
GetIt getIt = GetIt.instance;
void main() {
  serviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
void serviceLocator(){
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpApiRepository());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesHttpApiRepository());
}


