import 'dart:convert';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart' as http;

//Function to Get All Products
class GetAllProducts
{
  String baseUrl = "https://fakestoreapi.coml";
  Future<List<ProductModel>> getAllProducts()async
  {
   http.Response response = await http.get(Uri.parse("$baseUrl/products"));
   List<dynamic> data = jsonDecode(response.body);
   List<ProductModel> productList = [];
   for(int i =0   ; i<data.length ; i++){
     productList.add(ProductModel.fromJson(data[i]));
   }
   return productList;
  }
}