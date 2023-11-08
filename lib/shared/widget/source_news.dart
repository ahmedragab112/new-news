import 'package:flutter/material.dart';

class SourceNews extends StatelessWidget {
  const SourceNews(
      {super.key, required this.sourceName, required this.selected});
  final String sourceName;
  final bool selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: selected == true ? Colors.green : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
        ),
      ),
      child: Text(
        sourceName,
        style: TextStyle(
            color: selected == true ? Colors.white : Colors.green,
            fontSize: 20),
      ),
    );
  }
}
