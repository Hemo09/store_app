import 'package:flutter/material.dart';
import 'package:store/services/post_item.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: MaterialButton( onPressed: ()async{
          PostItem post = PostItem();
          await post.sendData();
        },child: const Text("enter")),
      ),
    );
  }
}
