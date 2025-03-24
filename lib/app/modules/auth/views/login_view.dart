import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () => controller.login(
                emailController.text,
                passwordController.text,
              ),
              child: controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : const Text('Login'),
            )),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Get.offAllNamed('/auth');
            }, child: Text("Pergi ke Register"))
          ],
        ),
      ),
    );
  }
}
