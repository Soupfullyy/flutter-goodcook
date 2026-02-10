import 'package:flutter/material.dart';
// import 'package:flutter_goodcook/global.dart';

import '../widgets/card.dart';
import '../widgets/custom_ink.dart';

class SearchRecipesPage extends StatefulWidget {
  const SearchRecipesPage({super.key});

  @override
  State<SearchRecipesPage> createState() => _SearchRecipesPageState();
}

class Recipe {
  String title, img;

  Recipe(this.title, this.img);
}

List<Recipe> recentRecipes = [
  Recipe('Brown Chicken Rice', 'brown_chicken_rice.jpg'),
  Recipe('Fish and Potato Pie', 'fish_and_potato_pie.jpg'),
  Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
  Recipe('Char Kway Teow', 'char-kway-teow.jpg')
];

List<Recipe> savedRecipes = [
  Recipe('Cold Beancurd with Braised Kinoko',
      'cold-beancurd-with-braised-kinoko.jpg'),
  Recipe('Char Kway Teow', 'char-kway-teow.jpg'),
  Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
  Recipe('Samosa with Mixed Vegetables', 'samosa_with_mixed_vegetables.jpg'),
];

class _SearchRecipesPageState extends State<SearchRecipesPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int activeTabIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    // add 2 tabs
    tabController = TabController(length: 2, vsync: this);

    // for styling unselected tab indicator
    tabController.addListener(() {
      setState(() {
        activeTabIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // showSemanticsDebugger: true,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 0,
          // to center title vertical, make height same as prefered size's
          toolbarHeight: 64.0,
          elevation: 0,
          title: SizedBox(
              height: 48,
              width: 280,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search for recipes',
                    // to center hint text w/ suffix
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 24),
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    suffixIconColor: Colors.grey),
                style: const TextStyle(fontSize: 16),
              )),
        ),
        body: Container(
          clipBehavior: Clip.none,
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          // padding for home + everything below
          padding: const EdgeInsets.symmetric(vertical: 8),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  'All recipes matching ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                child: ElevatedButton.icon(
                    onPressed: () => (),
                    icon: const Icon(Icons.filter_alt),
                    label: const Text('Filter'), style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                  child: ListView.separated(
                    // to place listview in scrollview without content's height taking up all the space
                    shrinkWrap: true,
                    primary: false,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.none,
                    itemCount: savedRecipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return LargeCard(
                          img: savedRecipes[index].img,
                          title: savedRecipes[index].title);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
