import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:opencritic_app/widgets/widgets.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> games = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test - 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: callApi,
      ),
    );
  }

/*
  void callApi() async {
    print('fetch started');
    const url =
        'https://opencritic-api.p.rapidapi.com/game/hall-of-fame?api_key=34fee49374mshf89a0ee9048d2aep15dadbjsn9647e0f64741';
    //const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      games = json['results'];
    });
    print('fetch completed');

    if (games != null && games.isNotEmpty) {
      print('it is not empty. Might be a formatting issue');
    } else {
      print('it is, sooooo empty');
    }
  }*/

//ERROR
  /*void callApi() async {
    try {
      print('fetch started');
      String _baseUrl = 'opencritic-api.p.rapidapi.com';
      const url =
          'https://opencritic-api.p.rapidapi.com/game/hall-of-fame';
      final uri = Uri.https(url);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);

        if (json != null && json.containsKey('results')) {
          setState(() {
            games = json['results'];
          });
          print('fetch completed');
        } else {
          print('No results or unexpected JSON format');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }*/

  void callApi() async {
    try {
      const apiKey =
          '34fee49374mshf89a0ee9048d2aep15dadbjsn9647e0f64741'; // Replace with your actual RapidAPI key
      const baseUrl = 'opencritic-api.p.rapidapi.com';
      const path = '/game/hall-of-fame';

      final uri = Uri.https(baseUrl, path);

      final response = await http.get(
        uri,
        headers: {
          'x-rapidapi-host': baseUrl,
          'x-rapidapi-key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        // Handle successful response
      } else {
        print('Request failed with status: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
}
