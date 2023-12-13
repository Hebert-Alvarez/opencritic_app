import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:opencritic_app/models/game.dart';
import 'package:opencritic_app/models/hall_of_fame_response.dart';
import 'package:opencritic_app/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridView extends StatelessWidget {
  final Map<String, dynamic> games;
  const StaggeredGridView({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: games.length,
          itemBuilder: (context, index) {
            var game = games.values.toList()[index]; // Accessing each game map

            // Accessing individual variables within the game map
            var name = game['name'] ??
                'Unknown'; // Using '??' to provide a default value if 'name' is null
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

            return ListTile(
              leading: Image.asset('assets/no-image.jpg'),
              //leading: Image.network(),
              title: Text(name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: $id'),
                  Text('Release Date: $firstReleaseDate'),
                  Text('Tier: $tier'),
                  Text('Critic Score: $topCriticScore'),
                ],
              ),
            );
          }),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Swiper(
        itemCount: games.length,
        layout: SwiperLayout.STACK, //Cómo se van a visualizar las tarjetas
        itemWidth: size.width * 0.6, //60%
        itemHeight: size.height * 0.4, //40%
        itemBuilder: (_, int index) {
          //index recorrerá la lista de películas
          final game = games[index];
          //print(movie.posterPath);
          //print(movie.fullPosterImg);
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: game),
            child: ClipRRect(
              //Tarjetas con borde redondo
              borderRadius: BorderRadius.circular(20),
              /*child: FadeInImage(
                //FadeInImage cambia la imagen por defecto a la intencionada cuando ésta última cargue
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(game.images.banner.sm),
              ),*/
            ),
          ); //Detector de gestos. duh
        }, //Contexto de datos sin utilizar -> (_)
      ),
    );
  }*/

/*  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: double.infinity,
        height: size.height * 0.5,
        //Clase "gridview" aparte"
        child: MasonryGridView.builder(
          itemCount: games.length,
          gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, int index) {
            final game = games[index];

            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: game),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image:
                        NetworkImage('HERE IS WHERE I WANT TO GET THE IMAGE'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }*/

//WORKS
  /*@override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: double.infinity,
        //Clase "gridview" aparte"
        child: MasonryGridView.builder(
          itemCount: 12,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: const FadeInImage(
                  //FadeInImage cambia la imagen por defecto a la intencionada cuando ésta última cargue
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage('assets/no-image.jpg')),
            ),
          ),
        ),
      ),
    );
  }*/
}
