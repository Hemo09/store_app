import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constant.dart';
class PostItem{
  Future <Response> sendData()async
  {
   http.Response response = await http.post(Uri.parse("$baseUrl/products") , body:
    {
    "title": "test product",
    "price": "12.5",
    "description": "lorem ipsum set",
    "image": "https://i.pravatar.cc",
    "category":"electronic",
    });
   print(response.body);
   return response;
  }
}