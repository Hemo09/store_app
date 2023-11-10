import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/update_item.dart';
import 'package:store/view/screens/home_page.dart';
import 'package:store/view/widgets/default_button.dart';
import 'package:store/view/widgets/default_text_form.dart';

class UpdateProduct extends StatefulWidget {
  UpdateProduct({super.key});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  String? price;
  bool isLoading = false;
  String? title, image, desc;

  @override
  Widget build(BuildContext context) {
    ProductModel data =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text(
          "Update Product",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextForm(
                type: TextInputType.text,
                hint: "ProductName",
                change: (value) {
                  title = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextForm(
                type: TextInputType.number,
                hint: "ProductPrice",
                change: (value) {
                  price = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextForm(
                type: TextInputType.text,
                hint: "description",
                change: (value) {
                  desc = value;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextForm(
                type: TextInputType.text,
                hint: "ProductImage",
                change: (value) {
                  image = value;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : DefaultButton(
                      text: "Update",
                      press: () async {
                        await update(data);
                        try {
                          isLoading = true;
                          setState(() {});

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("success")));
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                          print(e);
                        }
                        isLoading = false;
                        setState(() {});
                      }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> update(ProductModel data) async {
    await UpdateItem().updateItem(
        title: title == null ? data.title! : title!,
        description: desc == null ? data.description! : desc!,
        price: price == null ? data.price!.toString() : price!,
        image: image == null ? data.image! : image!,
        category: data.category,
        id: data.id);
  }
}
