import 'package:flutter/material.dart';

class Profile{
  String? name = '';
  String? email = '';
  String? phoneNo = '';
  String? passWord = '';

  // Profile({required String name, required String nric, required String dob, required String passWord});
  Profile( this.name, this.email, this.phoneNo, this.passWord);
}

// class wo constructor (just set values )
abstract class Global{
  static Profile? myProfile; // static <-- share w/ all widgets (null/empty at first) 
  final int theme = 0; // final <-- this is a theme that can't be changed
  static int volume = 25; // final <-- this is a volume that can be changed
  // static List<Widget> pages = [const HomePage(), const ProfilePage(), const SettingPage()];
  static List<Widget> pageTitles = [const Text('Home'), const Text('Grocery'), const Text('Recipes'), const Text('Menu')];
}

void createControllers(int number, List<TextEditingController> controllers){
  for (int i = 0; i < number; i++){
    TextEditingController controller = TextEditingController();
    controller.addListener(() { });
    controllers.add(controller);
  }
}