import 'package:bookclub_dr/bookHome.dart';
import 'package:bookclub_dr/login2.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => const LoginScreen2(),
          //'/Signup': (BuildContext context) => const SignupScreen(),

          '/BookHome': (BuildContext context) =>
              const BookHome(username: ' ', email: ' '),
          //'/TodoList': (BuildContext context) => TodoList(),
        });
  }
}
