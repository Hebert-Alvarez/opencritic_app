import 'package:flutter/material.dart';
import 'package:opencritic_app/models/game.dart';
import 'package:opencritic_app/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridView extends StatelessWidget {
  final List<Game> games;
  const StaggeredGridView({super.key, required this.games});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: double.infinity,
        //Clase "gridview" aparte"
        child: MasonryGridView.builder(
          itemCount: games.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (_, int index) {
            //index recorrerá la lista de películas
            final game = games[index];
            return GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'details', arguments: game),
              child: ClipRRect(
                //Tarjetas con borde redondo
                borderRadius: BorderRadius.circular(6),
                child: Image.asset('assets/no-image.jpg'),
                /*child: const FadeInImage(
                    //FadeInImage cambia la imagen por defecto a la intencionada cuando ésta última cargue
                    placeholder: AssetImage('assets/no-image.jpg'),
                    image: AssetImage('assets/no-image.jpg')),*/
              ),
            ); //Detector de gestos. duh
          },
        ),
      ),
    );
  }
}
