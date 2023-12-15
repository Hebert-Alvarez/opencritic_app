class FavGames {
  final String name;
  final String firstReleaseDate;
  final String tier;
  final String boxOg;
  final String topCriticScore;
  final String developer;

  const FavGames({
    required this.name,
    required this.firstReleaseDate,
    required this.tier,
    required this.boxOg,
    required this.topCriticScore,
    required this.developer,
  });

  factory FavGames.fromMap(Map<String, dynamic> game) {
    return FavGames(
      name: game['name'] ?? 'Unknown',
      firstReleaseDate: game['firstReleaseDate'],
      tier: game['tier'] ?? 'Unknown',
      boxOg: game['images']['box']['og'] ?? 'assets/no-image.jpg',
      topCriticScore: game['topCriticScore'] ?? 'Unknown',
      developer: game.containsKey('Companies') &&
              game['Companies'] != null &&
              game['Companies'].isNotEmpty
          ? game['Companies'][0][
              'name'] // Assuming 'Companies' is a list and you want the first company's name
          : 'Unknown',
    );
  }
}
