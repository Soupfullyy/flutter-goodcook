import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   extendBodyBehindAppBar: true,
        //   appBar: AppBar(
        //     title: Text('How to Flutter', style: TextStyle(
        //         color: Colors.white,
        //         fontSize: 28
        //     ),) ,
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //   ),
        //   body: Container(
        //     decoration: BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage('assets/images/login_bg.jpg'),
        //         fit: BoxFit.fill
        //       )
        //     ),
        //   ),
        // );
        Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Skip",
                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.black),
                ),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage("assets/images/login_bg.jpg"),
                        fit: BoxFit.contain),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 500,
                      // make width of containerthe same size as the screen
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                    child: Align(alignment: Alignment.center, child: Text(
                  "GoodCook",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold
                  ),
                )))
              ],
            ));
  }
}
