import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store/models/product_model.dart';
import 'package:store/services/get_all_products.dart';
import 'package:store/view/widgets/default_card.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: const Text("New trend" , style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(onPressed: (){}, icon:
          const Icon(FontAwesomeIcons.cartShopping , size: 23, color: Colors.black,),
          )
        ],
      ),
      body:FutureBuilder<List<ProductModel>>(
        future: GetAllProducts().getAllProducts(),
        builder: (context , snapshot){
          if(snapshot.hasData){
            List<ProductModel> data = snapshot.data!;
            return GridView.builder(
              itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
                itemBuilder: (context , index){
              return   DefaultCard(data: data[index],);
            });
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      )
    );
  }
}

