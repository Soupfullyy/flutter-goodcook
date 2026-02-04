import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child, this.title, this.height});
  final Widget? child;
  final String? title;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Align(
            alignment: Alignment.centerRight,
            child: Text("Skip",
                style: GoogleFonts.inter(
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                )),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("assets/images/login_bg.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: height ?? 520,
                  // make width of containerthe same size as the screen
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      color: Colors.white),
                  child: child!,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                  padding: const EdgeInsets.only(top: 54, left: 34),
                  child: Text(
                    title!,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      fontSize: 52,
                    ),
                  )))
          ],
        ));
  }
}
