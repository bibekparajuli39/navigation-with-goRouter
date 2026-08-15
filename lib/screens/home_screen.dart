import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/model/product/product.dart';
import 'package:nav_passdata/routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.islogin});
  final String? islogin;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController idControllor = TextEditingController();
  TextEditingController titleControllor = TextEditingController();
  TextEditingController priceControllor = TextEditingController();
  TextEditingController descriptionControllor = TextEditingController();
  TextEditingController categoryControllor = TextEditingController();
  TextEditingController imageControllor = TextEditingController();

  final Dio dio = Dio();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomeScreen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  context.go(Routes.productScreen, extra: "isthis first");
                },
                child: Text('Go to ProductScreen -> ${widget.islogin}'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),

              child: Column(
                spacing: 10,
                crossAxisAlignment: .start,
                children: [
                  Text('Fill the product'),
                  TextFormField(
                    controller: idControllor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: "id",
                    ),
                  ),
                  TextFormField(
                    controller: titleControllor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: "title",
                    ),
                  ),
                  TextFormField(
                    controller: priceControllor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: "price",
                    ),
                  ),
                  TextFormField(
                    controller: descriptionControllor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: "description",
                    ),
                  ),
                  TextFormField(
                    controller: categoryControllor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: "category",
                    ),
                  ),
                  TextFormField(
                    controller: imageControllor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      hintText: "image",
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        int id = int.parse(idControllor.text);
                        var title = titleControllor.text.trim;
                        var price = priceControllor.text.trim;
                        var description = descriptionControllor.text.trim;
                        var category = categoryControllor.text.trim;
                        var image = imageControllor.text.trim;
                        var productDetails = Product(
                          id: id,
                          title: title.toString(),
                        );

                        product(productDetails);
                      },
                      child: Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future product(Product productDetails) async {
    final response = await dio.post(
      "https://fakestoreapi.com/products",
      data: productDetails.toJson(),
    );
    final data = response.statusCode;
    print(data);
  }
}
