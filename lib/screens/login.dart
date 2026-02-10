import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/navigation.dart';
import 'package:flutter_goodcook/screens/signup.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:flutter_goodcook/widgets/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global.dart';

bool enableTempLogin = true;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  // final _emailController = TextEditingController();
  // final _pwdController = TextEditingController();

  final List<String> _listLabel = ['Email Address', 'Password'];
  final List<TextEditingController> _controller = [];

  @override
  void initState() {
    super.initState();
    createControllers(2, _controller);
    // _emailController.addListener(() {});
    // _pwdController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (enableTempLogin) {
      Global.myProfile = Profile('Tiara', 't@g',
      '90000000', '123', 'default');
      print('yes!!');
    }
    return CustomScaffold(
      title: 'Login',
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListView.builder(
                  // get rid of default padding
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  itemCount: _controller.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CustomTextFormField(
                        controller: _controller[index],
                        label: _listLabel[index],
                        hint: 'Enter your ${_listLabel[index]}',
                        validator: (value) {
                          if (value.isEmpty) {
                            return '${_listLabel[index]} can\'t be empty';
                          } else if (index == 0 &&
                              value != Global.myProfile?.email) {
                            return '${_listLabel[index]} does not exist';
                          } else {
                            return null;
                          }
                        });
                  },
                ),
                // CustomTextFormField(
                //   controller: _emailController,
                //   label: 'Email ID',
                //   hint: 'Enter your Email',
                // ),
                // CustomTextFormField(
                //     controller: _pwdController,
                //     label: 'Password',
                //     hint: 'Enter your Password'),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Navigation()),
                          (Route<dynamic> route) => false);
                    }
                  },
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
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SignUp()))),
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
            ),
          )),
    );
  }
}
