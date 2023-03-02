import 'dart:convert';
import 'dart:developer';

import 'package:bookapp/models/book.dart';
import 'package:bookapp/utilities/error.dart';
import 'package:http/http.dart' as http;

const _API_KEY = 'ApMg1MgBDinfJ2jx4eos57rqmu8QsYMH';

class BookService {
  final client = http.Client();

  Future<List<BookDto>> getBooks() async {
    final uri = Uri.parse(
        'https://api.nytimes.com/svc/books/v3/lists/full-overview.json?api-key=$_API_KEY');

    try {
      final response = await client.get(uri);

      if (response.statusCode != 200) {
        throw Failure('Failed to connect to server');
      }

      final data = jsonDecode(response.body)['results']['lists'][0]['books'];
      final List collection = data;
      final books = collection.map((json) => BookDto.fromJson(json)).toList();
      return books;
    } on Exception catch (e) {
      log(e.toString());
      throw Failure('Server error, try again in a moment');
    } on Error catch (e) {
      log(e.toString());
      throw Failure('Server error, try again in a moment');
    }
  }
}
