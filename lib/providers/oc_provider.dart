import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opencritic_app/models/game.dart';
import 'package:opencritic_app/models/hall_of_fame_response.dart';

class GameProvider extends ChangeNotifier {
  bool _callApi = true;
  final _baseUrl = 'opencritic-api.p.rapidapi.com';
  final _apiKey = '34fee49374mshf89a0ee9048d2aep15dadbjsn9647e0f64741';

  Map<String, dynamic> mapOfMaps = {};

  GameProvider() {
    getHallOfFame();
  }

  getHallOfFame() async {
    if (_callApi) {
      print('fetch started');
      var url = Uri.https(_baseUrl, '/game/hall-of-fame');

      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-host': _baseUrl,
          'x-rapidapi-key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        List<Map<String, dynamic>> listOfMaps =
            List<Map<String, dynamic>>.from(decodedData);

        mapOfMaps = {};

        for (int i = 0; i < listOfMaps.length; i++) {
          var hallOfFameResponse = HallOfFameResponse.fromJson(listOfMaps[i]);
          mapOfMaps[hallOfFameResponse.name] = {
            'id': hallOfFameResponse.id,
            'firstReleaseDate': hallOfFameResponse.getFormattedDate(),
            'tier': listOfMaps[i]['tier'],
            'images': {
              'box': {
                'og': hallOfFameResponse.images.box.og,
                'sm': hallOfFameResponse.images.box.sm,
              },
              'banner': {
                'og': hallOfFameResponse.images.banner.og,
                'sm': hallOfFameResponse.images.banner.sm,
              },
            },
            'topCriticScore': hallOfFameResponse.topCriticScore,
          };

          // Fetch detailed game information using the ID
          var gameUrl = Uri.https(_baseUrl, '/game/${hallOfFameResponse.id}');
          final gameResponse = await http.get(
            gameUrl,
            headers: {
              'x-rapidapi-host': _baseUrl,
              'x-rapidapi-key': _apiKey,
            },
          );

          if (gameResponse.statusCode == 200) {
            var gameData = json.decode(gameResponse.body);
            // Update the map with detailed game information
            mapOfMaps[hallOfFameResponse.name].addAll(gameData);
          }

          /*mapOfMaps.forEach((key, value) {
            print('Map with Name: $key');
            print(value); // This will print the content of each map
          });*/
        }
      }
    } else {
      print('not fetched');
    }
    notifyListeners();
  }

  /*getHallOfFame() async {
    if (_callApi) {
      //Si quiero que llame la api, esto es true
      print('fetch started');
      var url = Uri.https(_baseUrl, '/game/hall-of-fame');
      //response
      final response = await http.get(
        url,
        headers: {
          'x-rapidapi-host': _baseUrl,
          'x-rapidapi-key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> decodedData = json.decode(response.body);
        List<Map<String, dynamic>> listOfMaps =
            List<Map<String, dynamic>>.from(decodedData);

        mapOfMaps = {};

        for (int i = 0; i < listOfMaps.length; i++) {
          var hallOfFameResponse = HallOfFameResponse.fromJson(listOfMaps[i]);
          mapOfMaps[hallOfFameResponse.name] = {
            'id': hallOfFameResponse.id,
            'firstReleaseDate':
                hallOfFameResponse.getFormattedDate(), // Format the date here
            'tier': listOfMaps[i]['tier'],
            //'tier': hallOfFameResponse.tier,
            'images': {
              'box': {
                'og': hallOfFameResponse.images.box.og,
                'sm': hallOfFameResponse.images.box.sm,
              },
              'banner': {
                'og': hallOfFameResponse.images.banner.og,
                'sm': hallOfFameResponse.images.banner.sm,
              },
            },
            'topCriticScore': hallOfFameResponse.topCriticScore,
          };
        }

        mapOfMaps.forEach((key, value) {
          print('Map with Name: $key');
          print(value); // This will print the content of each map
        });
      }
    } else {
      //No llamará a la api
      print('not fetched');
    }
    notifyListeners();
  }*/
}
