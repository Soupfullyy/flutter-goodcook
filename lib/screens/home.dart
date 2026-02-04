import 'package:flutter/material.dart';
// import 'package:flutter_goodcook/global.dart';

import '../widgets/custom_ink.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class Recipe{
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
  Recipe('Cold Beancurd with Braised Kinoko', 'cold-beancurd-with-braised-kinoko.jpg'),
  Recipe('Char Kway Teow', 'char-kway-teow.jpg'),
  Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
  Recipe('Samosa with Mixed Vegetables', 'samosa_with_mixed_vegetables.jpg'),
];


class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          // padding for home + everything below
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
          alignment: Alignment.center,
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  CustomInk(),
                ],
              ),
              Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.shade300, width: 2.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TabBar(
                      labelStyle: const TextStyle(fontSize: 16),
                      indicatorColor: const Color.fromARGB(255, 116, 255, 204),
                      unselectedLabelColor: Colors.grey,
                      indicatorPadding: const EdgeInsets.only(bottom: 10),
                      controller: tabController,
                      tabs: const [
                        Tab(
                          text: 'Recent',
                        ),
                        Tab(
                          text: 'Saved',
                        ),
                      ],
                      labelColor: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: [
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemCount: recentRecipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SmallCard(img: recentRecipes[index].img, title: recentRecipes[index].title);
                    },
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                    ),
                    itemCount: savedRecipes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SmallCard(img: savedRecipes[index].img, title: savedRecipes[index].title);
                    },
                  ),
                ],
              ))
            ],
          )),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String img;
  final String title;
  const SmallCard({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints.tight(const Size.fromHeight(130)),
            child: Image.asset(
              'assets/images/$img',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                // when recipe name too long, add instead .... so the pixels don't overload
                overflow: TextOverflow.ellipsis,
              ),
          )
        ],
      ),
    );
  }
}
