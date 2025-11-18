import 'package:flutter/material.dart';
import 'package:kitmans_gallery/models/product.dart';
import 'package:kitmans_gallery/widgets/left_drawer.dart';
import 'package:kitmans_gallery/screens/product_detail.dart';
import 'package:kitmans_gallery/widgets/productEntry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MyProductListPage extends StatefulWidget {

  const MyProductListPage({super.key,});

  @override
  State<MyProductListPage> createState() => _MyProductListPageState();
}

class _MyProductListPageState extends State<MyProductListPage> {
  Future<List<Product>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get('https://rayhan-derya-kitmansgallery.pbp.cs.ui.ac.id/json/');
    // final response = await request.get('http://localhost:8000/json/');
    // Decode response to json format
    var data = response;
    
    // Convert json data to Product objects
    List<Product> listProduct = [];
    for (var d in data) {
      if (d != null && d['username'] == request.jsonData['username']) {
        listProduct.add(Product.fromJson(d));
      }
    }
    print(listProduct);
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Product List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Column(
                children: [
                  Text(
                    'There are no product yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no product yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductCard(
                  product: snapshot.data![index],
                  onTap: () {
                    // Navigate to Product detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(
                          product: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}