import 'package:flutter/material.dart';
import 'package:store/constant.dart';
import 'package:store/view/screens/home_page.dart';
import 'package:store/view/screens/update_product.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.homePage :(context)=>const HomePage(),
  AppRoutes.update:(context)=>UpdateProduct(),
};