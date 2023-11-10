import 'package:flutter/material.dart';
import 'package:store/constant.dart';
import 'package:store/models/product_model.dart';
class DefaultCard extends StatefulWidget {
   const DefaultCard({super.key , required this.data});
final ProductModel data ;

  @override
  State<DefaultCard> createState() => _DefaultCardState();
}

class _DefaultCardState extends State<DefaultCard> {
bool click = false;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        Navigator.pushNamed(context,AppRoutes.update,arguments: widget.data);
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(2),
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
            padding:  const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Center(child: Image.network(widget.data.image! , fit: BoxFit.fill,))),
                Text("${widget.data.title}" , maxLines: 1, style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                ),),
               const  SizedBox(height: 1,),
                Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${widget.data.price}"  , style:const  TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),),

                    IconButton(
                        onPressed: (){
                          setState(() {
                            click =!click;
                          });
                        },
                        icon:  Icon(click ? Icons.favorite:Icons.favorite_outline , color: Colors.red, size: 26),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
