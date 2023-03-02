import 'package:bookapp/Services/book_service.dart';
import 'package:bookapp/models/book.dart';
import 'package:bookapp/utilities/error.dart';
import 'package:flutter/material.dart';

class BookListController extends ChangeNotifier {
  final _api = BookService();

  List<BookDto> _books = [];
  List<BookDto> get books => _books;

  Future<void> getBooks() async {
    try {
      _books = await _api.getBooks();
      notifyListeners();
    } on Failure {
      rethrow;
    }
  }
}
