import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:book_list/models/books.dart';

class AppService {
  String baseUrl = "https://fakerapi.it/api/v1/";

  /// Makes request from the server and gets books quantity of [length]
  /// Returns the list of books if successed empty list otherwise.
  Future<List<Book>> get(int length) async {
    final uri = "books?_quantity=$length";
    try {
      final response = await http.get(Uri.parse(baseUrl + uri));
      return compute(parseBooks, response.body);
    } catch (e) {
      return <Book>[];
    }
  }

  ///Parses the json code [jsonBody] comes from the server
  ///
  ///Return list of books.
  List<Book> parseBooks(String jsonBody) {
    final decoded = jsonDecode(jsonBody);

    return decoded['data'].map<Book>((e) => Book.fromJson(e)).toList();
  }
}
