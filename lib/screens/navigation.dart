import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/menu.dart';
import 'package:flutter_goodcook/screens/home.dart';
import 'package:flutter_goodcook/screens/grocery.dart';
import 'package:flutter_goodcook/screens/recipes.dart';
// import 'package:flutter_goodcook/screens/search_recipes.dart';
import 'package:flutter_goodcook/global.dart' as g;
import 'package:flutter_goodcook/widgets/large_card.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;
  final List<String> _iconNames = ['home', 'grocery', 'recipes', 'menu'];
  // A list for all the pages that can be selected in navbar
  final List<Widget> _pages = <Widget>[
    const HomePage(),
    const GroceryPage(),
    const RecipePage(),
    const MenuPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> getBottomTabs(List<String> tabs) {
    return tabs
        .map(
          (item) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icon_$item.svg',
              width: 24,
              height: 24,
              colorFilter:
                  ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              'assets/images/icon_${item}_active.svg',
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(Color(0xFF64DC8E), BlendMode.srcIn),
            ),
            label: item.capitalize(),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    // A list for all the different appbars each selected page will have
    final List<Widget> appBars = <Widget>[
      // for home page
      AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 16,
          // to center title vertical, make height same as prefered size's
          toolbarHeight: 64.0,
          elevation: 0,
          title: SizedBox(
            height: 48,
            child: TextField(
              // when user taps on search bar, it'll open all search queries
              onTap: () async {
                await showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              decoration: searchInputDecoration(),
              style: const TextStyle(fontSize: 16),
            ),
          )),
      // for grocery
      AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // shape: const Border(bottom: BorderSide(color: Color(0xFFD8D8D8), width: 1)),
        titleSpacing: 24,
        toolbarHeight: 64.0,
        elevation: 0,
        title: const Text(
          'Grocery',
          style: TextStyle(
              fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      // for saved recipes
      AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 16,
          // to center title vertical, make height same as prefered size's
          toolbarHeight: 64.0,
          elevation: 0,
          title: SizedBox(
            height: 48,
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
                  suffixIcon: IconButton(
                      onPressed: () => (), icon: const Icon(Icons.search)),
                  suffixIconColor: Colors.grey),
              style: const TextStyle(fontSize: 16),
            ),
          )),
      // for menu
      AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // shape: const Border(bottom: BorderSide(color: Color(0xFFD8D8D8), width: 1)),
        titleSpacing: 24,
        toolbarHeight: 64.0,
        elevation: 0,
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ];

    return Scaffold(
        // prevent overflowing of content due to resizing for keyboard
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64.0),
          child: appBars[_selectedIndex],
        ),
        body: Center(child: _pages[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
            unselectedLabelStyle: const TextStyle(fontSize: 16),
            selectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedItemColor: Colors.grey[500],
            selectedItemColor: const Color(0xFF64DC8E),
            // currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
            currentIndex: _selectedIndex,
            items: getBottomTabs(_iconNames)
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.home_outlined,
            //       color: Colors.grey[500],
            //     ),
            //     activeIcon: const Icon(
            //       Icons.home,
            //     ),
            //     label: 'Home'),
            // BottomNavigationBarItem(
            //     icon: SvgPicture.asset(
            //       'assets/images/icon_grocery.svg',
            //       width: 24,
            //       height: 24,
            //       colorFilter:
            //           ColorFilter.mode(Colors.grey.shade500, BlendMode.srcIn),
            //     ),
            //     activeIcon: SvgPicture.asset(
            //       'assets/images/icon_cart_filled.svg',
            //       width: 24,
            //       height: 24,
            //       colorFilter: const ColorFilter.mode(
            //           Color(0xFF64DC8E), BlendMode.srcIn),
            //     ),
            //     label: 'Grocery'),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.bookmark_border_outlined,
            //       color: Colors.grey[500],
            //     ),
            //     activeIcon: const Icon(
            //       Icons.bookmark,
            //     ),
            //     label: 'Recipes'),
            // BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.menu_sharp,
            //       // manually set colour, else it wouldn't change
            //       color: _selectedIndex == 3
            //           ? const Color(0xFF64DC8E)
            //           : Colors.grey[500],
            //     ),
            //     label: 'Menu'),
            ));
  }

  InputDecoration searchInputDecoration() {
    return InputDecoration(
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
        suffixIcon: const Icon(
            // onPressed: () async {
            //   await showSearch(
            //     context: context,
            //     delegate: CustomSearchDelegate(),
            //   );
            // },

            // () => Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) => SearchRecipesPage())),
            // icon:
            (Icons.search)),
        suffixIconColor: Colors.grey);
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<g.Recipe> searchTerms = g.Global.recipes;

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).canvasColor,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          titleSpacing: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
            // to center hint text w/ suffix
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade100)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300)),
            suffixIconColor: Colors.grey));
  }

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
    List<g.Recipe> matchQuery = [];
    for (var recipe in searchTerms) {
      if (recipe.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(recipe);
      }
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Text(
          'All recipes matching $query',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    List<g.Recipe> matchQuery = [];
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
}
