import 'package:flutter/material.dart';
import 'package:flutter_goodcook/global.dart';
import 'package:flutter_goodcook/screens/home.dart';
import 'package:flutter_goodcook/screens/login.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:flutter_goodcook/widgets/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final dobController = TextEditingController();
  final pwdController = TextEditingController();
  final confPwdController = TextEditingController();

  @override
  initState(){
    super.initState();
    nameController.addListener(() {
      setState(() {});
    });

    emailController.addListener(() {
      setState(() {});
    });

    phoneController.addListener(() {
      setState(() {});
    });

    dobController.addListener(() {
      setState(() {});
    });

    confPwdController.addListener(() {
      setState(() {});
    });
  }


 @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Sign Up',
      height: 550,
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: nameController,
                label: 'Name',
                hint: 'Enter your Name',
              ),
              CustomTextFormField(
                controller: emailController,
                label: 'Email Address',
                hint: 'Enter your Email',
              ),
              CustomTextFormField(
                controller: phoneController,
                label: 'Phone No.',
                hint: 'Enter your Phone No.',
              ),
              CustomTextFormField(
                controller: dobController,
                label: 'Password',
                hint: 'Enter your Password'
              ),
              CustomTextFormField(
                controller: confPwdController,
                label: 'Confirm Password',
                hint: 'Enter your Password'
              ),
              FilledButton(
                onPressed: () 
                { 
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (Route<dynamic> route) => false);

                    // print(nameController.text);
                    Global.myProfile = Profile(nameController.text, emailController.text, phoneController.text, dobController.text, pwdController.text);
                  },
                    
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