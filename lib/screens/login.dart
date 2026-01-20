import 'package:flutter/material.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:flutter_goodcook/widgets/custom_scaffold.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    emailController.addListener(() {});
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
                  controller: emailController,
                  label: 'Password',
                  hint: 'Enter your Password'),
              FilledButton(
                onPressed: () => (),
                style: FilledButton.styleFrom(backgroundColor: Colors.black),
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => (), 
                child: const Text(
                  'New to GoodCook? Sign up', 
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    
                  ),
                ),
              )
            ],
          )),
    );
  }
}
