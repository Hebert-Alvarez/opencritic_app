import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:opencritic_app/models/game.dart';
import 'package:opencritic_app/models/hall_of_fame_response.dart';

//R
class GameProvider extends ChangeNotifier {
  String _baseUrl = 'opencritic-api.p.rapidapi.com';
  String _apiKey = '34fee49374mshf89a0ee9048d2aep15dadbjsn9647e0f64741';

  List<Game> hallOfFame = [];

  GameProvider() {
    getHallOfFame();
  }

  getHallOfFame() async {
    var url = Uri.http(_baseUrl, 'game/hall-of-fame', {'api_key': _apiKey});
    final response = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(response.body);

    final NowHALLofFame = HallOfFameResponse.fromRawJson(response.body);
    //hallOfFame = NowHALLofFame.results;
    notifyListeners();
  }
}
