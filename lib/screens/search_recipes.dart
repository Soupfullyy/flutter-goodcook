import 'package:flutter/material.dart';
import 'package:flutter_goodcook/global.dart';

import '../widgets/large_card.dart';

class SearchRecipesPage extends StatefulWidget {
  const SearchRecipesPage({super.key});

  @override
  State<SearchRecipesPage> createState() => _SearchRecipesPageState();
}

// class Recipe {
//   String title, img;

//   Recipe(this.title, this.img);
// }

// List<Recipe> Recipes = [
//   Recipe('Cold Beancurd with Braised Kinoko',
//       'cold-beancurd-with-braised-kinoko.jpg'),
//   Recipe('Char Kway Teow', 'char-kway-teow.jpg'),
//   Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
//   Recipe('Samosa with Mixed Vegetables', 'samosa_with_mixed_vegetables.jpg'),
// ];

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
    return Scaffold(
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  fillColor: Colors.grey[200],
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  suffixIconColor: Colors.grey),
              style: const TextStyle(fontSize: 16),
              onTap: () async {
                await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
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
                label: const Text('Filter'),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
                // child: ListView.separated(
                //   // to place listview in scrollview without content's height taking up all the space
                //   shrinkWrap: true,
                //   primary: false,
                //   physics: const NeverScrollableScrollPhysics(),
                //   clipBehavior: Clip.none,
                //   itemCount: Global.recipes.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     return LargeCard(
                //         img: Global.recipes[index].img,
                //         title: Global.recipes[index].title);
                //   },
                //   separatorBuilder: (context, index) => const SizedBox(
                //     height: 12,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// custom searchdelegate function for own searches
class CustomSearchDelegate extends SearchDelegate {
  List<Recipe> searchTerms = Global.recipes;

  // @override
  // ThemeData appBarTheme(BuildContext context) {
  //   return super.appBarTheme(context);
  // }
  // For clearing text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  // For search pop out menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.chevron_left),
    );
  }

  // for query result
  @override
  Widget buildResults(BuildContext context) {
    //if recipe matches what user searches, add to matchQUery for showing
    List<Recipe> matchQuery = [];
    for (var recipe in searchTerms) {
      if (recipe.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(recipe);
      }
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          label: const Text('Filter'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
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
                itemCount: matchQuery.length,
                itemBuilder: (BuildContext context, int index) {
                  return LargeCard(
                      img: matchQuery[index].img,
                      title: matchQuery[index].title);
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 12,
                ),
              )))
    ]);
  }

  // For showing query
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Recipe> matchQuery = [];
    for (var recipe in searchTerms) {
      if (recipe.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(recipe);
      }
    }
    return ListView.separated(
      // to place listview in scrollview without content's height taking up all the space
      shrinkWrap: true,
      primary: false,
      physics: const NeverScrollableScrollPhysics(),
      clipBehavior: Clip.none,
      itemCount: matchQuery.length,
      itemBuilder: (BuildContext context, int index) {
        return LargeCard(
            img: matchQuery[index].img, title: matchQuery[index].title);
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 12,
      ),
    );
  }
}
