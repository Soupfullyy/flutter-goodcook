import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  var email = '242390M@mymail.nyp.edu.sg.com';
  var phoneNum = '+65-5550-9999';
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
                        child: Column(
                          children: <Widget>[
                            const ListTile(
                              title: Text(
                                'Version',
                                style: titleTextStyle,
                              ),
                              subtitle: Text(
                                'Stable 0.1',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            const ListTile(
                                title: Text(
                                  'Company Info',
                                  style: titleTextStyle,
                                ),
                                subtitle: Text(
                                  'Goodcook.co',
                                  style: TextStyle(fontSize: 18),
                                )),
                            ListTile(
                                title: const Text(
                                  'Developed By',
                                  style: titleTextStyle,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Tiara Charis Tajudin',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    TextButton.icon(
                                      icon: const Icon(Icons.email_outlined),
                                      label: Text(
                                        email,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      style: TextButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 0)),
                                      onPressed: () {
                                        launchEmail();
                                        // _openLink(Uri(scheme: 'https', host: 'www.google.com'));
                                      },
                                    ),
                                    TextButton.icon(
                                      icon: const Icon(Icons.phone_outlined),
                                      label: Text(
                                        phoneNum,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      onPressed: () async {
                                        launchPhone();
                                      },
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    // push button to bottom
                  ])),
        ));
  }
  
  Future<void> launchEmail() async {
    // final String email = Uri.encodeComponent("test@gmail.com");
    final Uri params = Uri(
    scheme: 'mailto',
    path: email,
    query: 'subject=App Feedback&body=App Version 0.1', //add subject and body here
  );
    var url = params.toString();

    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
}

  Future<void> launchPhone() async {
    final Uri urlParsed = Uri.parse('tel:$phoneNum');

    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      throw 'Could not launch call to: $phoneNum';
    }
  }
}