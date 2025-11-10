import 'package:auto_route/annotations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

@RoutePage()
class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  final List<Map<String, dynamic>> books = const [
    {
      "title": "The Great Gatsby",
      "author": "F. Scott Fitzgerald",
      "year": 1925,
      "genre": "Novel",
      "rating": 4.4,
      "image": "assets/images/gatsby.jpg",
    },
    {
      "title": "1984",
      "author": "George Orwell",
      "year": 1949,
      "genre": "Dystopian",
      "rating": 4.7,
      "image": "assets/images/1984.jpg",
    },
    {
      "title": "To Kill a Mockingbird",
      "author": "Harper Lee",
      "year": 1960,
      "genre": "Classic",
      "rating": 4.8,
      "image": "assets/images/mockingbird.jpg",
    },
    {
      "title": "Harry Potter and the Philosopher's Stone",
      "author": "J.K. Rowling",
      "year": 1997,
      "genre": "Fantasy",
      "rating": 4.9,
      "image": "assets/images/harry_potter.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    ReplaceController controller = Get.put(ReplaceController());

    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 80,
              leadingWidth: MediaQuery.sizeOf(context).width * 0.23,
              centerTitle: true,
              elevation: 4,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text("Library", style: TextStyle(color: Colors.white)),
                centerTitle: true,
              ),
              leading: TextButton(
                style: ButtonStyle(
                  overlayColor: WidgetStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {},
                child: AutoSizeText(
                  minFontSize: 19,
                  maxFontSize: 45,
                  'Select',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              actions: [
                IconButton(
                  iconSize: MediaQuery.sizeOf(context).width * 0.07,
                  style: ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.transparent),
                  ),
                  onPressed: () {},
                  icon: Icon(Iconsax.search_normal_1_copy, color: Colors.white),
                ),
              ],
            ),

            SliverToBoxAdapter(
              child: Container(
                padding: const EdgeInsets.all(15),
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              'https://media.harrypotterfanzone.com/philsophers-stone-uk-childrens-edition-1050x0-c-default.jpg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Recent played:',
                                style: TextStyle(color: Colors.grey.shade400),
                              ),
                              SizedBox(
                                height: 47,
                                child: AutoSizeText(
                                  books[controller
                                      .selectedIndex
                                      .value]['title'],
                                  maxLines: 2,
                                  minFontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                minFontSize: 15,
                                maxFontSize: 25,
                                '48.9%',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              LinearPercentIndicator(
                                barRadius: Radius.circular(8),
                                percent: 0.5,
                                progressColor: Colors.red,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(childCount: books.length, (
                  context,
                  index,
                ) {
                  final book = books[index];
                  return GestureDetector(
                    onTap: () => controller.selectedIndex.value = index,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Text(
                            book["title"],
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Author: ${book["author"]}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          Text(
                            'Genre: ${book["genre"]}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 230,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: .8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReplaceController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
}
