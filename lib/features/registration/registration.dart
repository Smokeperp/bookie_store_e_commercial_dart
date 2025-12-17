import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:book_store_e_commercial/core/widgets/custom_text_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationState();
}

bool _isLoading = false;
String? _errorMessage;

class _RegistrationState extends State<RegistrationPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _signUp() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
       AutoRouter.of(context).replace(const WrapperRoute());
      print('Registration is successful');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
      print('Registration Error: $e');
    } catch (e) {
      setState(() {
        _errorMessage = 'An unexpected error occurred.';
      });
      print('General Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp', style: TextStyle(color: Colors.white),)
        , leading: IconButton( onPressed:() {
          
          context.router.back();
          
        } ,icon: Icon(Icons.arrow_back_ios), color: Colors.white, ),), 
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomTextFormField(
              hint: 'Email',
              prefixIcon: Icons.email,
              controller: _emailController,
              onChanged: (email) {},
            ),
            const SizedBox(height: 16),
            // Поле для Password
            CustomTextFormField(
              hint: 'Пароль',
              prefixIcon: Icons.lock,
              controller: _passwordController,
              obscureText: true, // Скрываем ввод пароля
              onChanged: (password) {},
            ),
            const SizedBox(height: 24),
            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    _isLoading ? Colors.grey : Colors.blueAccent),
                minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50)), // Растягиваем кнопку
              ),
              onPressed: () {
                _signUp();
              },
              child:
                  _isLoading
                      ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                      : const Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Colors.white),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
