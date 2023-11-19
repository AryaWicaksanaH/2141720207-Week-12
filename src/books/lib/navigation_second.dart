import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  @override
  Widget build(BuildContext context) {
    Color color;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen Arya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                child: const Text('Grey'),
                onPressed: () {
                  color = Color.fromARGB(255, 155, 158, 114);
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
                child: const Text('Red'),
                onPressed: () {
                  color = const Color.fromARGB(255, 104, 13, 13);
                  Navigator.pop(context, color);
                }),
            ElevatedButton(
                child: const Text('Blue'),
                onPressed: () {
                  color = const Color.fromARGB(255, 22, 54, 85);
                  Navigator.pop(context, color);
                }),
          ],
        ),
      ),
    );
  }
}
