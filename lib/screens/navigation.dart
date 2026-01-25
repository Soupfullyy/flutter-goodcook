import 'package:flutter/material.dart';
import 'package:flutter_goodcook/screens/menu.dart';
import 'package:flutter_goodcook/screens/home.dart';

// custom searchdelegate function for own searches
class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = ['Chicken Biryani'];

  // For clearing text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
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
      icon: Icon(Icons.arrow_back),
    );
  }

  // for query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      },
    );
  }

  // For showing query
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(title: Text(result));
      },
    );
  }
}

class Navigation extends StatefulWidget {
  Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedIndex = 0;

  // A list for all the pages that can be selected in navbar
  final List<Widget> _pages = <Widget>[
    Home(),
    const Text('Index 1: Grocery'),
    const Text('Index 0: Home'),
    Menu()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // A list for all the different appbars each selected page will have
    final List<Widget> _appBars = <Widget>[
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
                contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                fillColor: Colors.grey[200],
                filled: true,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade100)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                suffixIcon: IconButton(onPressed:() => (), icon: Icon(Icons.search)),
                suffixIconColor: Colors.grey),  
              style: TextStyle(fontSize: 16),
            ),
          )
          //   OutlinedButton.icon(
          //   onPressed: () {
          //       // Method to show the search bar
          //       showSearch(
          //         context: context,

          //         // Delegate to customize the search bar
          //         delegate: CustomSearchDelegate(),
          //       );
          //     },
          //   icon: const SizedBox(width: 280,),
          //   label: const Icon(Icons.search, color: Colors.black,),
          //   style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(16)),
          // ),

          // actions: [
          //   IconButton(
          //     color: Colors.black,
          //     onPressed: () {
          //       // Method to show the search bar
          //       showSearch(
          //         context: context,

          //         // Delegate to customize the search bar
          //         delegate: CustomSearchDelegate(),
          //       );
          //     },
          //     icon: const Icon(Icons.search),
          //   ),
          // ],
          ),
      AppBar(
        title: const Text('Grocery'),
      ),
      AppBar(
        title: const Text('Grocery'),
      ),
      AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // shape: const Border(bottom: BorderSide(color: Color(0xFFD8D8D8), width: 1)),
        titleSpacing: 24,
        toolbarHeight: 64.0,
        elevation: 0,
        title: const Text(
          'Menu',
          style: TextStyle(color: Colors.black),
        ),
      ),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64.0),
        child: _appBars[_selectedIndex],
      ),
      body: Center(
        child: _pages[_selectedIndex]
        ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(fontSize: 16),
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedItemColor: Colors.grey[500],
          selectedItemColor: Color(0xFF64DC8E),
          // currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Colors.grey[500],
                ),
                activeIcon: const Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_grocery_store_outlined,
                  color: Colors.grey[500],
                ),
                activeIcon: const Icon(
                  Icons.local_grocery_store,
                ),
                label: 'Grocery'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.grey[500],
                ),
                activeIcon: const Icon(
                  Icons.bookmark,
                ),
                label: 'Recipes'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_sharp,
                  // manually set colour, else it wouldn't change
                  color: _selectedIndex== 3? Color(0xFF64DC8E): Colors.grey[500],
                ),
                label: 'Menu'),
          ]),
    );
  }
}
