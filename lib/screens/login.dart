import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/navigation.dart';
import 'package:flutter_goodcook/screens/signup.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:flutter_goodcook/widgets/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {});
    pwdController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Login',
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: emailController,
                label: 'Email ID',
                hint: 'Enter your Email',
              ),
              CustomTextFormField(
                  controller: pwdController,
                  label: 'Password',
                  hint: 'Enter your Password'),
              FilledButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Navigation()),
                    (Route<dynamic> route) => false),
                    
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  'Login',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => const SignUp()))),
                child: Text(
                  'New to GoodCook? Sign up',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
