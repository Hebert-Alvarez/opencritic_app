import 'package:flutter/material.dart';
import 'package:opencritic_app/models/game.dart'; // Replace with the correct import path for your Game model

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> game;

  const DetailsScreen({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final Map<String, dynamic>? game = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    // You can access the properties from the 'game' map to display details
    var name = game['name'] ?? 'Unknown';
    var developer = game.containsKey('Companies') &&
            game['Companies'] != null &&
            game['Companies'].isNotEmpty
        ? game['Companies'][0]['name']
        : 'Unknown';
    var firstReleaseDate = game['firstReleaseDate'] ?? 'Unknown';
    var platforms = _getPlatforms(game['Platforms']);
    var description = game['description'] ?? 'No description available';
    var topCriticScore = game['topCriticScore'] ?? 'Unknown';
    var percentRecommended = game['percentRecommended'] ?? 'Unknown';

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Developer: $developer',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Release Date: $firstReleaseDate',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Platforms: $platforms',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Top Critic Score: $topCriticScore',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Percent Recommended: $percentRecommended',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }

  String _getPlatforms(List<dynamic> platforms) {
    // Assuming 'Platforms' is a list of maps with 'name' property for each platform
    return platforms.map((platform) => platform['name']).join(', ');
  }
}
