import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opencritic_app/models/game.dart';
import 'package:opencritic_app/models/hall_of_fame_response.dart';

//R
class GameProvider extends ChangeNotifier {
  bool _callApi = false;
  final _baseUrl = 'opencritic-api.p.rapidapi.com';
  final _apiKey = '34fee49374mshf89a0ee9048d2aep15dadbjsn9647e0f64741';

  List<Game> hallOfFame = [];

  GameProvider() {
    getHallOfFame();
  }

  getHallOfFame() async {
    if (_callApi) {
      try {
        print('fetch started');
        final uri = Uri.https(_baseUrl, '/game/hall-of-fame');
        final response = await http.get(
          uri,
          headers: {
            'x-rapidapi-host': _baseUrl,
            'x-rapidapi-key': _apiKey,
          },
        );

        if (response.statusCode == 200) {
          final List<dynamic> decodedData = jsonDecode(response.body);
          //final HALLOfFame = HallOfFameResponse.fromRawJson(response.body);
          //hallOfFame = HALLOfFame.results;
          notifyListeners();
          print(decodedData);
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
