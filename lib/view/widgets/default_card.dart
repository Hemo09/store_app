import 'package:flutter/material.dart';
import 'package:store/models/product_model.dart';
class DefaultCard extends StatelessWidget {
  const DefaultCard({super.key , required this.data});
final ProductModel data ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(5),
        height: 140,
        width: 180,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.3),
              blurRadius: 10.0,
              spreadRadius: 3,
              offset:const  Offset(1,1),
            ),
          ],
        ),
        child:  Padding(
          padding:  const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Center(child: Image.network(data.image! , fit: BoxFit.fill,))),
              Text("${data.title}" , maxLines: 1, style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w900,
                fontSize: 16,
              ),),
             const  SizedBox(height: 1,),
              Row(
                children: [
                  Text("\$${data.price}"  , style:const  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),
                  const Spacer(),
                  const Icon(Icons.favorite_outline),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
