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
          mapOfMaps[listOfMaps[i]['name']] = {
            'id': listOfMaps[i]['id'],
            'firstReleaseDate': listOfMaps[i]['firstReleaseDate'],
            'tier': listOfMaps[i]['tier'],
            'images': {
              'box': {
                'og': listOfMaps[i]['images']['box']['og'],
                'sm': listOfMaps[i]['images']['box']['sm'],
              },
              'banner': {
                'og': listOfMaps[i]['images']['banner']['og'],
                'sm': listOfMaps[i]['images']['banner']['sm'],
              },
            },
            'topCriticScore': listOfMaps[i]['topCriticScore'],
          };
        }
      }
    } else {
      //No llamará a la api
      print('not fetched');
    }
    notifyListeners();
  }

  getHallOfFameTest() async {
    if (_callApi) {
      try {
        print('fetch started');
        final uri = Uri.https(_baseUrl, 'game/hall-of-fame', {
          'x-rapidapi-key': _apiKey,
        });
        final response = await http.get(uri
            /*uri,
          headers: {
            'x-rapidapi-host': _baseUrl,
            'x-rapidapi-key': _apiKey,
          },*/
            );
        if (response.statusCode == 200) {
          final List<dynamic> decodedData = jsonDecode(response.body);
          print(decodedData);
          // Process the list data accordingly
        } else {
          print('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching data: $e');
      }
    } else {
      print('not fetched');
    }
  }
}
