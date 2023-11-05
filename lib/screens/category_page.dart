import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../shared/widget/builde_image.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.callBack});

  final Function callBack;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: .8),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          callBack(categoryList[index]);
        },
        child: BuildImage(
          categoryModel: categoryList[index],
        ),
      ),
      itemCount: categoryList.length,
    );
  }
}
