import 'package:flutter/material.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:flutter_goodcook/widgets/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final pwdController = TextEditingController();
  final confPwdController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Sign Up',
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
                hint: 'Enter your Password'
              ),
              CustomTextFormField(
                controller: confPwdController,
                label: 'Confirm Password',
                hint: 'Enter your Password'
              ),
              FilledButton(
                onPressed: () => (),
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.black,
      
                ),
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Have an existing account? Login',
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