import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

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
        alignment: Alignment.topCenter,
        color: Colors.grey[40],
        decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFD8D8D8)),
            borderRadius: const BorderRadius.all(Radius.circular(16))),
        width: double.infinity,
        // height: 240,
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
                const Divider(
                    height: 4, thickness: 1, color: Color(0xFFD8D8D8)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Appearance',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
                const Divider(
                    height: 4, thickness: 1, color: Color(0xFFD8D8D8)),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.chevron_right_outlined)
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                        (Route<dynamic> route) => false),
                    child: Text('Logout',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                        )
                    )
                  )
                )
              ],
            )),
      )
    ]);
  }
}
