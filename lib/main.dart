import 'package:flutter/material.dart';
import 'package:opencritic_app/screens/details.dart';
import 'package:opencritic_app/screens/home.dart';
import 'package:opencritic_app/providers/oc_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override //Provider here
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameProvider(),
          lazy: false,
        ),
      ],
      child: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hall of Fame',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (context) {
          // Extract the game argument passed through Navigator
          final Map<String, dynamic> game = ModalRoute.of(context)
                  ?.settings
                  .arguments as Map<String, dynamic> ??
              {};

          // Pass the game argument to DetailsScreen
          return DetailsScreen(game: game);
        },
      },
    );
  }
}
