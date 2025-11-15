import 'package:book_store_e_commercial/core/book/abstract_book_repository.dart';
import 'package:book_store_e_commercial/core/models/books_model.dart';
import 'package:dio/dio.dart';

String apiKey = 'AIzaSyCMOGan2aQeCCXkFP1ETjoWo6ST4OzCfAo';

class BookRepository implements AbstractBookRepository {
  final Dio dio;

  BookRepository({required this.dio});

@override
Future<List<BooksModel>> getBookList(String? query) async {
  if (query == null || query.trim().isEmpty) {
    return [];
  }

  final response = await dio.get(
    'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey',
  );

  final data = response.data as Map<String, dynamic>;

  final items = data['items'] as List<dynamic>;

  final books = items.map((item) {
    final volumeInfo = item['volumeInfo'] as Map<String, dynamic>;
    return BooksModel.fromJson(volumeInfo);
  }).toList();

  return books;
}

  @override
  Future<BooksModel> getBookDetail() {
    // TODO: implement getBookDetail
    throw UnimplementedError();
  }
}


