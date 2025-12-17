import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/route/router.dart';
import 'package:book_store_e_commercial/core/widgets/custom_text_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _isLoading = false;
  String? _errorMessage;

  Future<UserCredential?> login() async {
    try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if(googleUser == null ){
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }catch(e){  
      return null;
    }
  }

  Future<void> _signIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      AutoRouter.of(context).replace(const NavigationMenuRoute());
      print('Login is successful');

    } on FirebaseAuthException catch (e) {
      setState(() {
        _errorMessage = e.message;
      });
      print('Login Error: $e');

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
      appBar: AppBar(title: const Text('Вход в систему', style: TextStyle(color: Colors.white),)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextFormField(
              hint: 'Email',
              prefixIcon: Icons.email,
              controller: _emailController,
              onChanged: (email) {},
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              hint: 'Пароль',
              prefixIcon: Icons.lock,
              controller: _passwordController,
              obscureText: true, 
              onChanged: (password) {},
            ),

            if (_errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            
            IconButton(
              onPressed: ()async{
                final userCredential = await login();
                if (userCredential != null){
                  AutoRouter.of(context).replace(const NavigationMenuRoute());
                }
                }, icon: Image.network('http://pngimg.com/uploads/google/google_PNG19635.png', fit: BoxFit.cover, scale: MediaQuery.sizeOf(context).width * 0.04),
            ),
          

            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                    _isLoading ? Colors.grey : Colors.blueAccent),
                minimumSize: WidgetStatePropertyAll(
                    Size(double.infinity, 50)), 
              ),
              onPressed: _isLoading ? null : _signIn, 
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 3))
                  : const Text(
                      'Войти',
                      style: TextStyle(color: Colors.white),
                    ),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white),
                minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
              ),
              onPressed: () {

                AutoRouter.of(context).push(RegistrationRoute());

                print('Navigate to Registration Page');
              },
              child: const Text('Зарегистрироваться'),
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                shadowColor: WidgetStatePropertyAll(Colors.transparent),
                elevation: WidgetStatePropertyAll(0),
              ),
              onPressed: () {
                AutoRouter.of(context).push(ForgotRoute());                
                print('Forgot password logic');
              },
              child: const Text('Забыли пароль?', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}