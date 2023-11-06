import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            width: 400,
            child: const Text("Hello riverpod"),
          ),
          Positioned(
            left: 20,
            bottom: 200,
            child: Text("Widget one"),
          ),
          Positioned(
            left: 200,
            child: Text("Widget one"),
          ),
        ],
      ),
    );
  }
}
