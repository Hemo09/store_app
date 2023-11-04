import 'dart:convert';
import 'package:store/constant.dart';
import 'package:store/models/product_model.dart';
import 'package:http/http.dart'as http;
class GetProductItem
{
  Future<List<ProductModel>> getProductItem({required String category})
  async{
    http.Response response = await http.get(Uri.parse("$baseUrl/products/category/$category"));
    List<dynamic>data = jsonDecode(response.body);
    List<ProductModel> productItem = [];
    for(int i =0 ; i<data.length ; i++)
    {
     productItem.add(ProductModel.fromJson(data[i]));
    }
    return productItem;
  }
}