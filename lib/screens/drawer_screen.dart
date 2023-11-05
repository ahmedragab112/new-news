import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.category});
  final Function category;

  static const int catogryNumber = 1;
  static const int settingNumber = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width * .7,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.green,
            child: const Text(
              'News App',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              category(catogryNumber);
              Navigator.pop(context);
            },
            leading: const Icon(Icons.menu),
            title: Text('Category',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.black)),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              category(settingNumber);
                    Navigator.pop(context);
            },
            leading: const Icon(Icons.settings),
            title: Text(
              'Setting',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
