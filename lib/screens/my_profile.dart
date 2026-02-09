import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodcook/global.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit_profile.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    const titleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
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
            'Profile',
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
                          foregroundImage:
                              (Global.myProfile?.picture != 'default')
                                  ? const AssetImage(
                                      'assets/images/fish_and_potato_pie.jpg')
                                  : null,
                          child: (Global.myProfile?.picture == 'default')
                              ? const Icon(
                                  Icons.person_outline,
                                  color: Colors.grey,
                                  size: 42,
                                )
                              : null,
                        ),
                      ),
                    ),
                    ListTile(title: const Text( 'Name', style: titleTextStyle,), subtitle: Text( Global.myProfile?.name ?? '', style: TextStyle(fontSize: 18),),),
                    ListTile(title: const Text( 'Email', style: titleTextStyle,), subtitle: Text( Global.myProfile?.email ?? '', style: TextStyle(fontSize: 18),)),
                    ListTile(title: const Text( 'Password', style: titleTextStyle,), subtitle: Text( Global.myProfile?.passWord ?? '', style: TextStyle(fontSize: 18),)),
                    // push button to bottom
                    const Expanded(child: SizedBox()),
                    FilledButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfilePage()
                            )
                        );
                        // }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text(
                        'Edit',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ])),
        ));
  }
}
