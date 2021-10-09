import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Quotes extends ChangeNotifier {
  String? id;
  String? content;
  String? author;
  final List<String>? tags;
  int? length;
  Quotes({this.author, this.content, this.id, this.length, this.tags});

  late Quotes _item = Quotes();
  List<Quotes> _list = [];

  List<Quotes> get list => [..._list];
  Quotes get item => _item;

  factory Quotes.fromRawJson(String str) => Quotes.fromJson(json.decode(str));

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        id: json["_id"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        content: json["content"],
        author: json["author"],
        length: json["length"],
      );
  Future<void> getRandomQuote() async {
    const url = 'https://api.quotable.io/random';
    try {
      print(':: url => $url');
      // var resp = await http.get(
      //   Uri.parse(url),
      //   headers: {
      //     "Access-Control-Allow-Origin":
      //         "*", // Required for CORS support to work
      //     // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      //     "Access-Control-Allow-Headers":
      //         "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      //     "Access-Control-Allow-Methods": "POST, OPTIONS"
      //   },
      // );
      var resp = await Dio().get(
        url,
        options: Options(
          headers: {
            "Access-Control-Allow-Origin":
                "*", // Required for CORS support to work
            // "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
            "Access-Control-Allow-Headers":
                "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
            "Access-Control-Allow-Methods": "POST, OPTIONS"
          },
        ),
      );
      print(':: resp => $resp');
      final extractedData = json.decode(resp.data);
      Quotes loadedDetails = Quotes.fromJson(extractedData);
      print(extractedData.toString());

      print(':: loadedDetails => ${loadedDetails.content}');
      _item = loadedDetails;
      notifyListeners();
    } catch (err) {
      print(err.toString());
    }
  }

  Future<void> getQuotesOfTag(String tag) async {
    var url = 'https://api.quotable.io/quotes?tags=$tag';
    try {
      print(':: url => $url');
      final resp = await http.get(Uri.parse(url));
      print(':: resp => $resp');
      final extractedData = json.decode(resp.body);
      Quotes loadedDetails = Quotes.fromJson(extractedData);
      print(extractedData.toString());

      print(':: loadedDetails => ${loadedDetails.content}');
      // _list = loadedDetails;
      _item = loadedDetails;
      notifyListeners();
    } on Exception {
      print(' exception');
    } catch (err) {
      print(err.toString());
    }
  }
}
