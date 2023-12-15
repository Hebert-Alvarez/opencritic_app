import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<Map<String, String>> favGames = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    SharedPreferences faves = await SharedPreferences.getInstance();

    List<String> favoriteKeys =
        faves.getKeys().where((key) => key.startsWith('favorite_')).toList();
    print('Favorite Keys: $favoriteKeys');

    List<Map<String, String>> favorites = [];

    for (String key in favoriteKeys) {
      String jsonData = faves.getString(key) ?? '{}';

      Map<String, dynamic> gameData = json.decode(jsonData);

      favorites.add({
        'name': gameData['name'] ?? '',
        'firstReleaseDate': gameData['firstReleaseDate'] ?? '',
        'tier': gameData['tier'] ?? '',
        'boxOg': gameData['boxOg'] ?? '',
        'topCriticScore': gameData['topCriticScore'] ?? '',
        'developer': gameData['developer'] ?? '',
      });
    }

    print('Favorite Games: $favorites');

    setState(() {
      favGames = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Games'),
      ),
      body: favGames.isEmpty
          ? Center(
              child: Text('No favorites yet.'),
            )
          : ListView.builder(
              itemCount: favGames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  //leading: Image.network(
                  //'https://img.opencritic.com/${favGames[index]['boxOg'] ?? ''}'),
                  title: Text(favGames[index]['name'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Release Date: ${favGames[index]['firstReleaseDate'] ?? ''}'),
                      Text('Tier: ${favGames[index]['tier'] ?? ''}'),
                      Text('Developer: ${favGames[index]['developer'] ?? ''}'),
                      Text(
                          'Critic Score: ${favGames[index]['topCriticScore'] ?? ''}'),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
