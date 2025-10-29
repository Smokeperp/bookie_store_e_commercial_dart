import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ShopSearchBar extends StatefulWidget {
  const ShopSearchBar({super.key});

  @override
  State<ShopSearchBar> createState() => _ShopSearchBarState();
}

class _ShopSearchBarState extends State<ShopSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      dividerColor: Colors.white,
      viewBackgroundColor: Colors.blueGrey.shade800,
      viewElevation: 1,
      isFullScreen: false,
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          
          padding: const WidgetStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 13.0),
          ),
          hintText: 'Search for books',
          backgroundColor: WidgetStatePropertyAll<Color>(
            Colors.blueGrey.shade800,
          ),
          controller: controller,
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Iconsax.book_saved),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return List<ListTile>.generate(5, (int index) {
          final String item = 'item $index';
          return ListTile(
            title: Text(item),
            onTap: () {
              setState(() {
                controller.closeView(item);
              });
            },
          );
        });
      },
    );
  }
}
