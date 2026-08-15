import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/model/product/product.dart';
import 'package:nav_passdata/routes/routes.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key, this.first});
  final String? first;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> product = [];
  bool isLoading = false;
  final Dio dio = Dio();

  @override
  void initState() {
    getProduct();
    super.initState();
  }

  Future getProduct() async {
    try {
      isLoading = true;
      final response = await dio.get("https://fakestoreapi.com/products");
      print("Api response ${response.statusCode}");
      final List data = response.data;
      // json we need to convert it Dart
      product = data.map((e) => Product.fromJson(e)).toList();
      print(product[0].id);
    } catch (e) {
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Sceen')),
      body: Center(
        child: InkWell(
          onTap: () {
            context.go(Routes.secondScreen, extra: " isthis second");
          },
          child: Column(
            children: [
              Text('Go to Second Screen ${widget.first}'),
              isLoading
                  ? Container(
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.only(top: 300),
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,

                        itemCount: product.length,

                        itemBuilder: (context, index) {
                          final item = product[index];
                          return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(100),
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: .start,
                              spacing: 20,
                              children: [
                                Image.network(
                                  product[index].image.toString(),
                                  height: 150,
                                  width: 100,
                                ),

                                Expanded(
                                  child: Column(
                                    spacing: 10,
                                    crossAxisAlignment: .start,

                                    children: [
                                      Text(
                                        product[index].title.toString() ?? '',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        product[index].category.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      Row(
                                        spacing: 5,
                                        crossAxisAlignment: .center,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(item.rating!.rate.toString()),
                                          Text(item.rating!.count.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                Container(
                                  padding: EdgeInsets.only(
                                    top: 50,
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: Column(
                                    spacing: 10,
                                    mainAxisAlignment: .center,
                                    crossAxisAlignment: .center,
                                    children: [
                                      Text("\$${item.price}"),
                                      Icon(Icons.shopping_cart),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future login() async {
    final response = await dio.post("");
  }
}
