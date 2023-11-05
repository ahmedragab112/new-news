import 'package:flutter/material.dart';

class CategoryModel {
  final bool side;
  final String image;

  final Color color;
  final String txt;
  const CategoryModel(
      {required this.color,
      required this.image,
      required this.side,
      required this.txt});
}

List<CategoryModel> categoryList = const [
  CategoryModel(
    color: Colors.red,
    side: false,
    image: 'assets/images/ball.png',
    txt: 'sports',
  ),
  CategoryModel(
    color: Colors.blue,
    side: true,
    image: 'assets/images/Politics.png',
    txt: 'Politics',
  ),
  CategoryModel(
    color: Colors.pink,
    side: false,
    image: 'assets/images/health.png',
    txt: 'health',
  ),
  CategoryModel(
    color: Colors.brown,
    side: true,
    image: 'assets/images/bussines.png',
    txt: 'business',
  ),
  CategoryModel(
    color: Color(0xff4882CF),
    side: false,
    image: 'assets/images/environment.png',
    txt: 'Enviroment',
  ),
  CategoryModel(
    color: Color(0xffF2D352),
    side: true,
    image: 'assets/images/science.png',
    txt: 'Science',
  )
];
 