import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/about_us.dart';
import 'package:flutter_goodcook/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_profile.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 64),
        child: CircleAvatar(
          backgroundColor: Colors.amber,
          backgroundImage: AssetImage('assets/images/brown_chicken_rice.jpg'),
          maxRadius: 64,
        ),
      ),
      Container(
        alignment: Alignment.bottomCenter,
        color: Colors.grey[40],
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFD8D8D8)),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: ListView(
                      shrinkWrap: true,
                      children: ListTile.divideTiles(context: context, tiles: [
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Profile'),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyProfilePage())),
                          trailing: const Icon(Icons.chevron_right_outlined),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('Theme'),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyProfilePage())),
                          trailing: const Icon(Icons.chevron_right_outlined),
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          title: const Text('About Us'),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutUsPage())),
                          trailing: const Icon(Icons.chevron_right_outlined),
                        )
                      ]).toList()),
                ),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                            (Route<dynamic> route) => false),
                        child: Text('Logout',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ))))
              ],
            )),
      )
    ]);
  }
}
