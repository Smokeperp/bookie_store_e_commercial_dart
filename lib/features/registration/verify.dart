import 'dart:async'; // Не забудь добавить этот импорт
import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  Timer? timer; // Таймер для автоматической проверки

  @override
  void initState() {
    super.initState();
    sendVerifyLink();

    // Запускаем проверку каждые 3 секунды
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => checkEmailVerified(),
    );
  }

  @override
  void dispose() {
    timer?.cancel(); // ОБЯЗАТЕЛЬНО останавливаем таймер при выходе
    super.dispose();
  }

  // Проверяем, подтвержден ли email
  checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    
    if (FirebaseAuth.instance.currentUser?.emailVerified ?? false) {
      timer?.cancel(); // Останавливаем таймер
      if (mounted) {
        AutoRouter.of(context).replace(const WrapperRoute());
      }
    }
  }

  sendVerifyLink() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Verification link sent to your email!')),
        );
      }
    } catch (e) {
      print("Error sending email: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Добавлен Scaffold для корректного отображения
      backgroundColor: Colors.black, 
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email_outlined, size: 80, color: Colors.white),
              const SizedBox(height: 20),
              const Text(
                'Verify your email',
                style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We have sent a link to your email. Please click it to continue.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 30),
              const CircularProgressIndicator(color: Colors.white), // Визуальный индикатор ожидания
              const SizedBox(height: 20),
              TextButton(
                onPressed: sendVerifyLink,
                child: const Text('Resend email', style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}