import 'package:flutter/material.dart';
import 'package:flutter_goodcook/widgets/custom_ink.dart';

import '../widgets/card.dart';

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
  Recipe('Cold Beancurd with Braised Kinoko',
      'cold-beancurd-with-braised-kinoko.jpg'),
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
    return Container(
      clipBehavior: Clip.none,
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      // padding for home + everything below
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'All saved recipes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                // for add button
                CustomInk(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24,0,24,12),
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
    );
  }
}



// class FadingMask extends StatelessWidget {
//   final Widget? child;
//   const FadingMask({super.key, this.child});

//   @override
//   Widget build(BuildContext context) {
//     return ShaderMask(
//           shaderCallback: (Rect rect) {
//             return LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [Colors.purple, Colors.transparent, Colors.transparent, Colors.purple],
//               stops: [0.0, 0.1, 0.9, 1.0], // 10% purple, 80% transparent, 10% purple
//             ).createShader(rect);
//           },
//           blendMode: BlendMode.dstOut,
//           child: child!,
//     );
//   }
// }