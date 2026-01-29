import 'package:flutter/material.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class Recipe {
  String title, img;

  Recipe(this.title, this.img);
}

List<Recipe> savedRecipes = [
  Recipe('Cold Beancurd with Braised Kinoko','cold-beancurd-with-braised-kinoko.jpg'),
  Recipe('Char Kway Teow', 'char-kway-teow.jpg'),
  Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
  Recipe('Samosa with Mixed Vegetables', 'samosa_with_mixed_vegetables.jpg'),
  Recipe('Classic Spaghetti Bolognese', 'classic-spaghetti-bolognese.jpg'),
  Recipe('Samosa with Mixed Vegetables', 'samosa_with_mixed_vegetables.jpg'),
];

class _RecipePageState extends State<RecipePage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    // add 2 tabs
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All saved recipes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Ink(
                  decoration: const ShapeDecoration(
                      color: Color(0xFFA5FFC5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                  child: IconButton(
                      onPressed: () => (), icon: const Icon(Icons.add)),
                ),
              ],
            ),
            Expanded(
              child: ListView.separated(
                itemCount: savedRecipes.length,
                itemBuilder: (BuildContext context, int index) {
                  return SmallCard(
                      img: savedRecipes[index].img,
                      title: savedRecipes[index].title);
                },
                separatorBuilder: (context, index) => const SizedBox(height: 12,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final String img;
  final String title;
  const SmallCard({super.key, required this.img, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // constraints: BoxConstraints.tight(Size(200, 200)),
      height: 120,
      child: Card(
        elevation: 6.0,
        margin: const EdgeInsets.all(0.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/$img'),fit: BoxFit.cover, height: 120, width: 120,),
            const Text("texts cdppdwpwdpwdpolumn"),
            const Expanded(child: SizedBox()), //this is crucial- this keeps icon always at the end

            // Container(
            //   // constraints: BoxConstraints.tight(const Size.fromHeight(130)),
            //   child: Image.asset(
            //     'assets/images/$img',
            //     fit: BoxFit.cover,
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     title,
            //     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            //     textAlign: TextAlign.center,
            //     // when recipe name too long, add instead .... so the pixels don't overload
            //     overflow: TextOverflow.ellipsis,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
