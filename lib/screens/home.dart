import 'package:flutter/material.dart';
import 'package:opencritic_app/providers/oc_provider.dart';
import 'package:opencritic_app/widgets/staggered_gridview.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gamesProvider = Provider.of<GameProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          )
        ],
        elevation: 0,
        title: const Text('OpenCritic - Hall of Fame (2023)'),
      ),
      body: Column(
        children: [
          Expanded(
            child: StaggeredGridView(games: gamesProvider.mapOfMaps),
          ),
        ],
      ),
    );
  }
}
