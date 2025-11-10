import 'package:json_annotation/json_annotation.dart';

part 'books_model.g.dart';

@JsonSerializable()
class BooksModel {
  final String title;
  final String? imageLinks;

  BooksModel({
    required this.title,
    this.imageLinks,
  });

  // From JSON
  factory BooksModel.fromJson(Map<String, dynamic> json) => _$BooksModelFromJson(json);

  // To JSON
  Map<String, dynamic> toJson() => _$BooksModelToJson(this);
}
