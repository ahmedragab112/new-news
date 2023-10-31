import 'package:flutter/material.dart';

import '../shared/widget/builde_image.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  String category = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text('''Pick your category 
      of interest'''),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildImage(
                  side: true,
                  image: 'assets/images/ball.png',
                  function: () {
                    category = 'sports';

                    setState(() {});
                  },
                ),
                BuildImage(
                  side: false,
                  image: 'assets/images/Politics.png',
                  function: () {
                    category = 'Politics';

                    setState(() {});
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildImage(
                    side: true,
                    image: 'assets/images/health.png',
                    function: () {
                      category = 'health';

                      setState(() {});
                    }),
                BuildImage(
                    side: false,
                    image: 'assets/images/bussines.png',
                    function: () {
                      category = 'bussines';

                      setState(() {});
                    })
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BuildImage(
                    side: true,
                    image: 'assets/images/environment.png',
                    function: () {
                      category = 'environment';

                      setState(() {});
                    }),
                BuildImage(
                    side: false,
                    image: 'assets/images/science.png',
                    function: () {
                      category = 'science';

                      setState(() {});
                    })
              ],
            )
          ],
        ),
      ),
    );
  }
}
