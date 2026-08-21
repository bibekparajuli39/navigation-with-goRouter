import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_passdata/model/product/product.dart';
import 'package:nav_passdata/network/api_end_point.dart';
import 'package:nav_passdata/routes/routes.dart';
import 'package:nav_passdata/services/api_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.islogin});
  final String? islogin;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleControllor = TextEditingController();
  TextEditingController priceControllor = TextEditingController();
  TextEditingController descriptionControllor = TextEditingController();
  TextEditingController categoryControllor = TextEditingController();
  TextEditingController imageControllor = TextEditingController();
  bool isloading = false;
  bool isload = false;

  final Dio dio = Dio();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleControllor.dispose();
  }

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
                      onPressed: () async {
                        var title = titleControllor.text.trim();
                        var price = double.parse(priceControllor.text.trim());
                        var description = descriptionControllor.text.trim();
                        var category = categoryControllor.text.trim();
                        var image = imageControllor.text.trim();
                        var productDetails = Product(
                          title: title,
                          price: price,
                          description: description,
                          category: category,
                          image: image,
                        );

                        await product(productDetails);
                      },
                      child: isloading
                          ? CircularProgressIndicator()
                          : Text("Submit"),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        await userDelete(2);
                      },
                      child: isload
                          ? CircularProgressIndicator()
                          : Text("Delete User"),
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

  Future<void> userDelete(int id) async {
    try {
      isload = true;
      setState(() {});
      final response = await dio.delete("https://fakestoreapi.com/users/id");
      final data = response.data;
      print(data);
      if (response.statusCode == 200) {
        print(data);
      }
    } catch (e) {
      print(e);
    } finally {
      isload = false;
      setState(() {});
    }
  }

  Future product(Product productDetails) async {
    try {
      isloading = true;
      setState(() {});

      // final response = await dio.post(
      //   "https://fakestoreapi.com/products",
      //   data: productDetails.toJson(),
      // );
      final response = await ApiService().post(ApiEndPoint.products);
      final data = response.statusCode;
      final printdat = response.data;
      print(data);
      print(printdat);
    } catch (e) {
    } finally {
      isloading = false;
      setState(() {});
    }
  }
}
