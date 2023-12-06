import 'package:flutter/material.dart';
import 'package:opencritic_app/screens/home.dart';
/*import 'package:opencritic_app/providers/oc_provider.dart';
import 'package:opencritic_app/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

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
        //(_) -> Contexto de datos
        'home': (_) => Home(),
      },
    );
  }
}
*/

/*void Main() {
  runApp(const MyApp());
}*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({super.key});
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
