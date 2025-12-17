import 'package:auto_route/auto_route.dart';
import 'package:book_store_e_commercial/core/widgets/custom_text_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ForgotPage extends StatefulWidget {
  const ForgotPage({super.key});

  @override
  State<ForgotPage> createState() => _ForgotState();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();

reset() async {
  await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
}


class _ForgotState extends State<ForgotPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('SignUp', style: TextStyle(color: Colors.white),)
        , leading: IconButton( onPressed:() {
          
          context.router.back();
          
        } ,icon: Icon(Icons.arrow_back_ios), color: Colors.white, ),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            CustomTextFormField(
              hint: 'Search',
              prefixIcon: Icons.email,
              controller: email,
              onChanged: (email) {},
            ),
            SizedBox(height: 15,),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.white)
              ),
              onPressed: () {
                reset();
              },
              child: Text('Send link'),
            ),
          ],
        ),
      ),
    );
  }
}