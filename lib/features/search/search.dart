import 'package:auto_route/annotations.dart';
import 'package:book_store_e_commercial/core/book/abstract_book_repository.dart';
import 'package:book_store_e_commercial/core/models/books_model.dart';
import 'package:book_store_e_commercial/core/widgets/custom_text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<String> previousSearches = [];
  final _repository = GetIt.I<AbstractBookRepository>();
  late Future<List<BooksModel>> _booksFuture;
  String? changedValue;
  bool isSearched = false;

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _booksFuture = _repository.getBookList("Абай ку");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 55, 12, 1),
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      hint: "Search",
                      prefixIcon: Iconsax.search_normal_1,
                      controller: searchController,
                      filled: true,
                      suffixIcon:
                          searchController.text.isEmpty
                              ? null
                              : Icons.cancel_sharp,
                      onTapSuffixIcon: () {
                        setState(() {
                          searchController.clear();
                          isSearched = false; // вернулись к истории
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          if (value.trim().isEmpty) {
                            isSearched = false;
                            _booksFuture = Future.value([]);
                          } else {
                            isSearched = true;
                            _booksFuture = _repository.getBookList(value);
                          }
                        });
                      },

                      onEditingComplete: () {
                        if (searchController.text.isNotEmpty) {
                          setState(() {
                            previousSearches.add(searchController.text);
                          });
                        }
                        debugPrint('List of items: $previousSearches');
                      },
                    ),
                  ),
                ],
              ),
            ),

            if (!isSearched)...[

              if (previousSearches.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recently searched',
                        style: TextStyle(
                          color: Colors.grey.shade300,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        style: ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            previousSearches.clear();
                          });
                        },
                        child: Text(
                          'Clear',
                          style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Previous Searches
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: previousSearches.length,
                  physics: PageScrollPhysics(),
                  itemBuilder: (context, index) => previousSearchItems(index),
                ),
              ],
            const SizedBox(height: 8),

            // Search Suggestion
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Search Suggestions',
                      style: TextStyle(fontSize: 20, color: Colors.grey.shade300),
                    ),
                    SizedBox(height: 19),
                    Row(
                      children: [
                        searchSuggestionTime("asdsaasfsafasfd"),
                        searchSuggestionTime("asdsad"),
                      ],
                    ),
                    SizedBox(height: 13),
                    Row(
                      children: [
                        searchSuggestionTime("dsad"),
                        searchSuggestionTime("asdsasd"),
                      ],
                    ),
                  ],
                ),
              ),
            ],



            if (isSearched)
              // ListOfBooks
              Expanded(
                child: FutureBuilder<List<BooksModel>>(
                  future: _booksFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "Ошибка: ${snapshot.error}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          "Ничего не найдено",
                          style: TextStyle(color: Colors.white70),
                        ),
                      );
                    }
                    final books = snapshot.data!;
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        final book = books[index];
                        return ListTile(
                          leading:
                              book.thumbnail != null
                                  ? Image.network(book.thumbnail!)
                                  : const Icon(Icons.book, color: Colors.white),
                          title: Text(
                            book.title,
                            style: const TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  previousSearchItems(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            setState(() {
              previousSearches.removeAt(index);
            });
          },
          child: Row(
            children: [
              const Icon(Iconsax.timer_1, color: Colors.white),
              const SizedBox(width: 15),
              Text(
                previousSearches[index],
                style: TextStyle(color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.call_made_outlined, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}

searchSuggestionTime(String text) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    decoration: BoxDecoration(
      color: Colors.grey.shade800,
      borderRadius: BorderRadius.circular(30),
    ),
    child: Text(text, style: TextStyle(color: Colors.white)),
  );
}
