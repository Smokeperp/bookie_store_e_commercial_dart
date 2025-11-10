import 'package:book_store_e_commercial/core/models/books_model.dart';

abstract class AbstractBookRepository {
  Future<List<BooksModel>> searchBooks(String title);

  Future<BooksModel> getBookDetail(int bookId);
}