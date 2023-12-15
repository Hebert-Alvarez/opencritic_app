import 'package:flutter/material.dart';
import 'package:opencritic_app/screens/check_auth_screen.dart';
import 'package:opencritic_app/screens/details.dart';
import 'package:opencritic_app/screens/favorites.dart';
import 'package:opencritic_app/screens/home.dart';
import 'package:opencritic_app/providers/oc_provider.dart';
import 'package:opencritic_app/screens/loginScreen.dart';
import 'package:opencritic_app/screens/registerScreen.dart';
import 'package:opencritic_app/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GameProvider(),
          lazy: false,
        ),
        ChangeNotifierProvider(create: (_) => AuthService()),
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
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginScreen(),
        'register': (_) => RegisterScreen(),
        'checking': (_) => CheckAuthScreen(),
        'home': (_) => HomeScreen(),
        'favorites': (_) => FavoritesScreen(),
        'details': (context) {
          final Map<String, dynamic> game = ModalRoute.of(context)
                  ?.settings
                  .arguments as Map<String, dynamic> ??
              {};
          return DetailsScreen(game: game);
        },
      },
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: Colors.grey[400],
          appBarTheme: AppBarTheme(elevation: 0, color: Colors.grey[800]),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.grey[800], elevation: 0)),
    );
  }
}
