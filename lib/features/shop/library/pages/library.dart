import 'package:flutter/material.dart';

class libraryScreen extends StatefulWidget {
  const libraryScreen({super.key});

  @override
  State<libraryScreen> createState() => _libraryScreenState();
}

class _libraryScreenState extends State<libraryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
                  "Library",
                  style: TextStyle(color: Colors.black),
                  
                ),
                centerTitle: true,
         
         ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(15), // слева
              child: Container(
                color: Colors.amber,
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15),

              itemCount: 15,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 230,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: .8,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print('Pressed $index');
                  },
                  child:                 Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  child: Text('Box $index', style: TextStyle(color: Colors.white)),
                ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
