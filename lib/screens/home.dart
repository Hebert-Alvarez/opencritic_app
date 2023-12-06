import 'package:flutter/material.dart';
import 'package:opencritic_app/providers/oc_provider.dart';
import 'package:opencritic_app/widgets/staggered_gridview.dart';
import 'package:opencritic_app/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
        title: Text('OpenCritic - Hall of Fame (2023)'),
      ),
      body: Column(
        children: [
          //StaggeredGridView(games: gamesProvider.hallOfFame),
          StaggeredGridView(games: gamesProvider.hallOfFame),
          /*Container(
            child: Text('Date', textAlign: TextAlign.end),
          ),*/
        ],
      ),
    );
  }
}
