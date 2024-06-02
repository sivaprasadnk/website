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
  final List<Quotes> _list = [];

  List<Quotes> get list => [..._list];
  Quotes get item => _item;

  factory Quotes.fromRawJson(String str) =>
      Quotes.fromJson(json.decode(str) as Map<String, dynamic>);

  factory Quotes.fromJson(Map<String, dynamic> json) => Quotes(
        id: json["_id"].toString(),
        // ignore: avoid_dynamic_calls
        tags: List<String>.from(
          // ignore: avoid_dynamic_calls
          json["tags"].map((x) => x) as Iterable<dynamic>,
        ),
        content: json["content"].toString(),
        author: json["author"].toString(),
        length: json["length"] as int,
      );
  Future<void> getRandomQuote() async {
    const url = 'https://api.quotable.io/random';
    try {
      debugPrint(':: url => $url');
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
      final resp = await Dio().get(
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
      debugPrint(':: resp => $resp');
      final extractedData = json.decode(resp.data.toString());
      final Quotes loadedDetails =
          Quotes.fromJson(extractedData as Map<String, dynamic>);
      debugPrint(extractedData.toString());

      if (kDebugMode) {
        debugPrint(':: loadedDetails => ${loadedDetails.content}');
      }
      _item = loadedDetails;
      notifyListeners();
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<void> getQuotesOfTag(String tag) async {
    final url = 'https://api.quotable.io/quotes?tags=$tag';
    try {
      debugPrint(':: url => $url');
      final resp = await http.get(Uri.parse(url));
      debugPrint(':: resp => $resp');
      final extractedData = json.decode(resp.body);
      final Quotes loadedDetails =
          Quotes.fromJson(extractedData as Map<String, dynamic>);
      debugPrint(extractedData.toString());

      debugPrint(':: loadedDetails => ${loadedDetails.content}');
      // _list = loadedDetails;
      _item = loadedDetails;
      notifyListeners();
    } on Exception {
      debugPrint(' exception');
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
