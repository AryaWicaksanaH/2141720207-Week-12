import 'package:flutter/material.dart';
import 'package:books/navigation_second.dart';

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = const Color.fromARGB(255, 0, 48, 95);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(title: const Text('Navigation First Screen Arya')),
      body: Center(
        child: ElevatedButton(
            child: const Text('Change color'),
            onPressed: () {
              _navigateAndGetColor(context);
            }),
      ),
    );
  }

  Future _navigateAndGetColor(BuildContext context) async {
    color = await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const NavigationSecond()),
        ) ??
        const Color.fromARGB(255, 0, 48, 95);
    setState(() {});
  }
}
