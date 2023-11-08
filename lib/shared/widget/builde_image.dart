import 'package:flutter/material.dart';
import 'package:news_app_cours/models/category_model.dart';

class BuildImage extends StatelessWidget {
  const BuildImage({super.key, required this.categoryModel});
  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: 148,
      padding: const EdgeInsets.symmetric(vertical: 20),
      height: 171,
      decoration: BoxDecoration(
        color: categoryModel.color,
        borderRadius: BorderRadius.only(
          bottomLeft: categoryModel.side == false
              ? const Radius.circular(20)
              : Radius.zero,
          bottomRight: categoryModel.side == true
              ? const Radius.circular(20)
              : Radius.zero,
          topLeft: const Radius.circular(20),
          topRight: const Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            categoryModel.image,
            fit: BoxFit.fill,
            width: 132,
            height: 116,
          ),
          Text(
            categoryModel.txt,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
