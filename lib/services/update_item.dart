import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:store/models/product_model.dart';

import '../constant.dart';
class UpdateItem{
  Future <ProductModel> updateItem(
      {
        required String title,
        required String description,
        required dynamic price,
        required String image,
         String? category,
      }
      )async
  {
    http.Response response = await http.put(Uri.parse("$baseUrl/products") , body:
    {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category":category,
    }
    );
    Map<String , dynamic> data = jsonDecode(response.body);
    print(data);
    return ProductModel.fromJson(data);
  }
}