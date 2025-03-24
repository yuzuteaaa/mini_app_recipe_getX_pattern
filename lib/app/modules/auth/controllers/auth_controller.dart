import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var isLoading = false.obs;

  Future<void> register(String name, String email, String password) async {
    isLoading(true);
    final url = Uri.parse('https://recipe.incube.id/api/register');

    try {
      final response = await http.post(
        url,
        body: {
          'name': name,
          'email': email,
          'password': password,
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        String token = data['data']['token'];
        await _saveToken(token); // Simpan token ke SharedPreferences
        Get.snackbar('Success', 'Registrasi berhasil');
        Get.offAllNamed('/home'); // Redirect ke home setelah register
      } else {
        Get.snackbar('Error', data['message'] ?? 'Gagal registrasi');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> login(String email, String password) async {
    isLoading(true);
    final url = Uri.parse('https://recipe.incube.id/api/login');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
        },
      );

      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        String token = data['data']['token'];
        await _saveToken(token); // Simpan token ke SharedPreferences
        Get.snackbar('Success', 'Login berhasil');
        Get.offAllNamed('/home'); // Redirect ke home setelah login
      } else {
        Get.snackbar('Error', data['message'] ?? 'Gagal login');
      }
    } catch (e) {
      Get.snackbar('Error', 'Terjadi kesalahan: $e');
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    await _removeToken(); // Hapus token dari SharedPreferences
    Get.offAllNamed('/login');
  }

  Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}
