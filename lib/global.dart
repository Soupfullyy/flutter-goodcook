import 'package:flutter/material.dart';

class Profile {
  String? name = '';
  String? email = '';
  String? phoneNo = '';
  String? passWord = '';
  String? picture = '';

  // Profile({required String name, required String nric, required String dob, required String passWord});
  Profile(this.name, this.email, this.phoneNo, this.passWord, this.picture);
}

class Recipe {
  String title, img;

  Recipe(this.title, this.img);
}

// class wo constructor (just set values )
abstract class Global {
  static Profile?
      myProfile; // static <-- share w/ all widgets (null/empty at first)
  final int theme = 0; // final <-- this is a theme that can't be changed
  // static List<Widget> pages = [const HomePage(), const ProfilePage(), const SettingPage()];
  static List<Widget> pageTitles = [
    const Text('Home'),
    const Text('Grocery'),
    const Text('Recipes'),
    const Text('Menu')
  ];
  static List<Recipe> recipes = [
    Recipe('Cold Beancurd with Braised Kinoko',
        'cold-beancurd-with-braised-kinoko.jpg'),
    Recipe('Char Kway Teow', 'char-kway-teow.jpg'),
    Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
    Recipe('Samosa with Mixed Vegetables', 'samosa_with_mixed_vegetables.jpg'),
  ];
}

void createControllers(int number, List<TextEditingController> controllers) {
  for (int i = 0; i < number; i++) {
    TextEditingController controller = TextEditingController();
    controller.addListener(() {});
    controllers.add(controller);
  }
}

void createSetControllers(int number, List<TextEditingController> controllers,
    List<String> listText) {
  for (int i = 0; i < number; i++) {
    TextEditingController controller =
        TextEditingController.fromValue(TextEditingValue(text: listText[i]));
    controller.addListener(() {});
    controllers.add(controller);
  }
}
