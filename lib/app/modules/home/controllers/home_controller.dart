import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/recipe.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var recipes = <Recipe>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
  }

  Future<void> fetchRecipes() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('auth_token');

      if (token == null) {
        Get.offAllNamed('/login'); // Jika tidak ada token, arahkan ke login
        return;
      }

      final response = await http.get(
        Uri.parse('https://recipe.incube.id/api/recipes'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List recipesData = data['data']['data'];
        recipes.assignAll(recipesData.map((e) => Recipe.fromJson(e)).toList());
      } else {
        Get.snackbar('Error', 'Gagal mengambil data resep');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }
}


