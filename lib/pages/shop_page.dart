import 'package:book_store_e_commercial/components/search_bar.dart';
import 'package:flutter/material.dart';



class ShopPage extends StatefulWidget{
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener( () {
      if (_controller.position.pixels >= _controller.position.maxScrollExtent ){
        debugPrint('Reached the limit');
        
      }
    } );
    
  }

  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('BookieStore', style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView( 
        padding: EdgeInsets.all(16),   
        child: Column(
          children: [

            ShopSearchBar(),
            SizedBox(height: 30,),
            
            SizedBox(
              height: 120,
              child: ListView.builder(
                controller: _controller,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    width: 100,
                    margin: const EdgeInsets.only(right: 10),
                    color: Colors.amber,
                  );
                },
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
