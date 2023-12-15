import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    int topCriticScoreInt = topCriticScore.toInt();
    var percentRecommended = game['percentRecommended'] ?? 'Unknown';
    int percentRecommendedInt = percentRecommended.toInt();
    var banner = game['images']['banner']['sm'] ?? 'default_image_path.jpg';

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                placeholder: AssetImage('assets/placeholder.jpg'),
                image: NetworkImage('https://img.opencritic.com/$banner'),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4.0),
            Text(
              'Developer: $developer',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Release Date: ${firstReleaseDate.toString().substring(0, 10)}',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Platforms: $platforms',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Top Critic Score: $topCriticScoreInt',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
              'Percent Recommended: $percentRecommendedInt%',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Container(
              margin: const EdgeInsets.all(1.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      15.0), // Adjust the radius as needed
                ),
                color: Colors.cyan[900],
                elevation:
                    5, // You can adjust the elevation for a shadow effect
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Description: $description',
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveAsFavorite(context),
        child: Icon(Icons.favorite), // Replace with your desired icon
        tooltip: 'Favorites', // Tooltip for the button
      ),
    );
  }

  String _getPlatforms(List<dynamic> platforms) {
    // Assuming 'Platforms' is a list of maps with 'name' property for each platform
    return platforms.map((platform) => platform['name']).join(', ');
  }

  Future<void> _saveAsFavorite(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final String key = 'favorite_${game['name']}';

    // Prepare the data to be stored
    Map<String, dynamic> favoriteData = {
      'name': game['name'] ?? 'Unknown',
      'firstReleaseDate': game['firstReleaseDate'] ?? 'Unknown',
      'tier': game['tier'] ?? 'Unknown',
      'boxOg': game['images']['box']['og'] ?? 'assets/no-image.jpg',
      'topCriticScore': game['topCriticScore'] ?? 'Unknown',
      'developer': game.containsKey('Companies') &&
              game['Companies'] != null &&
              game['Companies'].isNotEmpty
          ? game['Companies'][0]['name']
          : 'Unknown',
    };

    // Convert the Map to a JSON string
    String jsonData = json.encode(favoriteData);

    // Save the JSON string into SharedPreferences
    await prefs.setString(key, jsonData);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Added to favorites: ${game['name']}'),
    ));
  }
}
