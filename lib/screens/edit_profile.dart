import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodcook/global.dart';
import 'package:flutter_goodcook/widgets/custom_textformfield.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final List<String> _listLabel = [
    'Name',
    'Email',
    'Password',
  ];
  final List<String> _listTextEditingVal = [
    Global.myProfile?.name ?? '',
    Global.myProfile?.email ?? '',
    Global.myProfile?.passWord ?? '',
  ];

  final List<TextEditingController> _controller = [];

  @override
  initState() {
    super.initState();
    createSetControllers(3, _controller, _listTextEditingVal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () {
            // Global.myProfile!.picture = ;
            // if (_formKey.currentState!.validate()) {
            Navigator.pop(context);
            // }
          },
        ),
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
                      child: DottedBorder(
                        borderType: BorderType.Circle,
                        dashPattern: [20, 10],
                        strokeWidth: 2,
                        color: Colors.grey,
                        child: CircleAvatar(
                          radius: 64,
                          backgroundColor: Colors.transparent,
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
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controller.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomTextFormField(
                          controller: _controller[index],
                          label: _listLabel[index],
                          validator: (value) {
                            if (value.isEmpty) {
                              return ' can\'t be empty';
                            } else {
                              return null;
                            }
                          });
                    },
                  ),
                  // push button to bottom
                  const Expanded(child: SizedBox()),
                ])),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: FilledButton(
          onPressed: () {
            // if (_formKey.currentState!.validate()) {
            Navigator.pop(context);
            // }
            Global.myProfile?.name = _controller[0].text;
            Global.myProfile?.email = _controller[1].text;
            Global.myProfile?.passWord = _controller[2].text;
          },
          style: FilledButton.styleFrom(
            backgroundColor: Colors.black,
          ),
          child: Text(
            'Save',
            style: GoogleFonts.inter(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
