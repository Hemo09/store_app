import 'dart:convert';
import 'package:http/http.dart' as http;
//Function to get Al Categories
class GetAllCategories
{
  Future<List<dynamic>> getCategories()
  async{
    http.Response response = await http.get(Uri.parse("https://fakestoreapi.com/products/categories"));
    List<dynamic> data = jsonDecode(response.body);
    return data;
  }

}