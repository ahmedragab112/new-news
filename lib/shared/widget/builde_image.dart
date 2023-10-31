import 'package:flutter/material.dart';

class BuildImage extends StatelessWidget {
  const BuildImage(
      {super.key,
      required this.side,
      required this.image,
      required this.function});
  final bool side;
  final String image;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        width: 100,
        height: 171,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.only(
              bottomLeft: side == true ? Radius.circular(20) : Radius.zero,
              bottomRight: side == true ? Radius.circular(20) : Radius.zero,
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
      ),
    );
  }
}
