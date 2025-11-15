import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel {
  final String title;
  final String? thumbnail; // ссылка на обложку

  BooksModel({
    required this.title,
    this.thumbnail,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) {
    return BooksModel(
      title: json['title'] ?? 'No title',
      thumbnail: json['imageLinks'] != null ? json['imageLinks']['thumbnail'] : null,
    );
  }


  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}
