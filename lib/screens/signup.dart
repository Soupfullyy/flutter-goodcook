import 'package:flutter/material.dart';
import 'package:flutter_goodcook/global.dart';
import 'package:flutter_goodcook/screens/login.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:flutter_goodcook/widgets/custom_scaffold.dart';
import 'package:google_fonts/google_fonts.dart';


class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String confirmPass = '';
  final _formKey = GlobalKey<FormState>();
  // final nameController = TextEditingController();
  // final emailController = TextEditingController();
  // final phoneController = TextEditingController();
  // final dobController = TextEditingController();
  // final pwdController = TextEditingController();
  // final confPwdController = TextEditingController();
  final List<String> _listLabel = [
    'Name',
    'Email',
    'Phone',
    'Password',
    'Confirm Password'
  ];

  final List<TextEditingController> _controller = [];
  //   final List _validators = [
  //   (value) {
  //     if (value == null || value.isEmpty) {
  //       return ' can\'t be empty';
  //     }
  //   },
  //   (value) {
  //     if (value == null || value.isEmpty) {
  //       return ' can\'t be empty';
  //     }
  //     return null;
  //   },
  //   (value) {
  //     if (value == null || value.isEmpty) {
  //       return ' can\'t be empty';
  //     }
  //     return null;
  //   },
  //       (value) {
  //     if (value == null || value.isEmpty) {
  //       return ' can\'t be empty';
  //     }
  //     return null;
  //   },
  // ];

  @override
  initState() {
    super.initState();
    // nameController.addListener(() {
    //   setState(() {});
    // });

    // emailController.addListener(() {
    //   setState(() {});
    // });

    // phoneController.addListener(() {
    //   setState(() {});
    // });

    // dobController.addListener(() {
    //   setState(() {});
    // });

    // confPwdController.addListener(() {
    //   setState(() {});
    // });
    createControllers(5, _controller);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Sign Up',
      height: 550,
      child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          return '${_listLabel[index]} can\'t be empty';}
                        else if (index == 3){
                          confirmPass = value;
                          return null;
                        }
                        else if(index == 4 && value != confirmPass){
                          return '${_listLabel[index]} does not match';
                        }
                        else{
                          return null;
                      }}
                    );
                  },
                ),
                // CustomTextFormField(
                //   controller: nameController,
                //   label: 'Name',
                //   hint: 'Enter your Name',
                // ),
                // CustomTextFormField(
                //   controller: emailController,
                //   label: 'Email Address',
                //   hint: 'Enter your Email',
                // ),
                // CustomTextFormField(
                //   controller: phoneController,
                //   label: 'Phone No.',
                //   hint: 'Enter your Phone No.',
                // ),
                // CustomTextFormField(
                //   controller: dobController,
                //   label: 'Password',
                //   hint: 'Enter your Password'
                // ),
                // CustomTextFormField(
                //   controller: confPwdController,
                //   label: 'Confirm Password',
                //   hint: 'Enter your Password'
                // ),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const Login()),
                          (Route<dynamic> route) => false);
          
                      // print(nameController.text);
                      Global.myProfile = Profile(
                          _controller[0].text,
                          _controller[1].text,
                          _controller[2].text,
                          _controller[3].text,);
                    }
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
            ),
          )),
    );
  }
}
