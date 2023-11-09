import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:store/constant.dart';
import 'package:store/firebase_options.dart';
import 'package:store/routes.dart';
import 'package:store/view/screens/home_page.dart';

void main()
  async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: AppRoutes.homePage,
      home: const HomePage(),
    );
  }
}

