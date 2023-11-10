import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:store/models/product_model.dart';

import '../constant.dart';

class UpdateItem {
  Future<ProductModel> updateItem({
    required String title,
    required String description,
    required dynamic price,
    required String image,
    String? category,
    required int id,
  }) async {
    http.Response response =
        await http.put(Uri.parse("$baseUrl/products/$id"), body: {
      "title": title,
      "price": price,
      "description": description,
      "image": image,
      "category": category,
    });
    Map<String, dynamic> data = jsonDecode(response.body);
    return ProductModel.fromJson(data);
  }
}
