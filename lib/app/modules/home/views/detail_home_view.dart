import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/recipe.dart';
class DetailHomeView extends StatelessWidget {
  const DetailHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final Recipe recipe = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              recipe.photoUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    recipe.description,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
