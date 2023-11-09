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
  TextEditingController nameController = TextEditingController();

   TextEditingController priceController = TextEditingController();

   TextEditingController descriptionController = TextEditingController();

   TextEditingController imageController = TextEditingController();

dynamic price;
bool  isLoading  =false;

   @override
  Widget build(BuildContext context) {
     ProductModel data = ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: const Text("Update Product"  ,style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 19,
        ),),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextForm(
                type: TextInputType.text, hint: "ProductName" ,
                controller: nameController,
              ),
              const SizedBox(height: 10,),
              DefaultTextForm(type: TextInputType.number, hint: "ProductPrice" ,
                submit: (value){
                price = int.parse(value!);
                },

              ),
              const SizedBox(height: 10,),
              DefaultTextForm(type: TextInputType.text, hint: "${data.title}" ,
                controller: descriptionController,
              ),
              const SizedBox(height: 10,),
              DefaultTextForm(type: TextInputType.text, hint: "ProductImage" ,
                controller: imageController,
              ),
              const SizedBox(height: 30,),
              isLoading? const CircularProgressIndicator():DefaultButton(text: "Update" , press: (){
                 try{
                   isLoading = true;
                   setState(() {

                   });
                   UpdateItem().updateItem(title: nameController.text,
                       description: descriptionController.text,
                       price:price,
                       image: imageController.text,
                       category: data.category
                   );
                 }catch(e){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:  Text(e.toString())));
                 }
                 isLoading = false;
                 setState(() {

                 });
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const HomePage()));
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
