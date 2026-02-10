import 'package:flutter/material.dart';
import 'package:flutter_goodcook/global.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // shape: const Border(bottom: BorderSide(color: Color(0xFFD8D8D8), width: 1)),
          titleSpacing: 24,
          toolbarHeight: 64.0,
          elevation: 0,
          title: const Text(
            'About Me',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
              width: double.infinity,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: 180,
                      width: double.infinity,
                      child: Center(
                        child: CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 8),
                        child: Theme(
                          data: ThemeData(
                            splashFactory: NoSplash.splashFactory,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          child: const Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'Version',
                                  style: titleTextStyle,
                                ),
                                subtitle: Text(
                                  'Stable 0.1',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              ListTile(
                                  title: Text(
                                    'Company Info',
                                    style: titleTextStyle,
                                  ),
                                  subtitle: Text(
                                    'Goodcook.co',
                                    style: TextStyle(fontSize: 18),
                                  )),
                              ListTile(
                                  title: Text(
                                    'Developed By',
                                    style: titleTextStyle,
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Tiara Charis Tajudin',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        'p@gmail.com',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        '9999 9999',
                                        style: TextStyle(fontSize: 18),
                                      )
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // push button to bottom
                  ])),
        ));
  }
}
