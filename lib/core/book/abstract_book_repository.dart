import 'package:book_store_e_commercial/core/models/books_model.dart';

abstract class AbstractBookRepository {


  Future<List<BooksModel>> getBookList(String? query);

  Future<BooksModel> getBookDetail();
}