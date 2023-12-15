import 'package:flutter/material.dart';
import 'package:opencritic_app/models/game.dart';

class ListViewWidget extends StatelessWidget {
  final Map<String, dynamic> games;
  const ListViewWidget({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: games.length,
          itemBuilder: (context, index) {
            //var game = games.values.toList()[index]; // Accessing each game map
            var gameKey = games.keys.toList()[index]; // Accessing each game key
            var game = games[gameKey]; // Accessing each game map

            var name = gameKey ?? 'Unknown';

            // Accessing individual variables within the game map
            /*var name = game['name'] ??
                'Unknown';*/ // Using '??' to provide a default value if 'name' is null
            var id = game['id'] ?? 'Unknown';
            var firstReleaseDate = game['firstReleaseDate'];
            var tier = game['tier'] ?? 'Unknown';
            var boxOg = game['images']['box']['og'] ?? 'assets/no-image.jpg';
            var boxSm = game['images']['box']['sm'] ?? 'assets/no-image.jpg';
            var bannerOg =
                game['images']['banner']['og'] ?? 'assets/no-image.jpg';
            var bannerSm =
                game['images']['banner']['sm'] ?? 'assets/no-image.jpg';
            var topCriticScore = game['topCriticScore'] ?? 'Unknown';

            var Developer = game.containsKey('Companies') &&
                    game['Companies'] != null &&
                    game['Companies'].isNotEmpty
                ? game['Companies'][0][
                    'name'] // Assuming 'Companies' is a list and you want the first company's name
                : 'Unknown';

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: game),
              child: ListTile(
                //leading: Image.asset('assets/no-image.jpg'),
                leading: Image.network('https://img.opencritic.com/$boxOg'),
                title: Text(name),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Developer: $Developer'),
                    Text('ID: $id'),
                    Text('Release Date: $firstReleaseDate'),
                    Text('Tier: $tier'),
                    Text('Critic Score: $topCriticScore'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
