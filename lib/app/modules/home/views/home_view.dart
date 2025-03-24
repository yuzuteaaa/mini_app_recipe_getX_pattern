import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Resep'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.recipes.isEmpty) {
          return const Center(child: Text('Tidak ada resep tersedia'));
        }

        return ListView.builder(
          itemCount: controller.recipes.length,
          itemBuilder: (context, index) {
            final recipe = controller.recipes[index];
            return Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: Image.network(recipe.photoUrl, width: 50, height: 50, fit: BoxFit.cover),
                title: Text(recipe.title),
                subtitle: Text(recipe.description),
                onTap: () {
                  Get.toNamed('/detail', arguments: recipe);
                },
              ),
            );
          },
        );
      }),
    );
  }
}
