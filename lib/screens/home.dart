import 'package:flutter/material.dart';
import 'package:opencritic_app/providers/oc_provider.dart';
import 'package:opencritic_app/widgets/ListView.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gamesProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('OpenCritic - Hall of Fame (2023)'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, 'favorites');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListViewWidget(games: gamesProvider.mapOfMaps),
          ),
        ],
      ),
    );
  }
}
