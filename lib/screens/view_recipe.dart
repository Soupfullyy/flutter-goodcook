import 'package:flutter/material.dart';
import 'package:flutter_goodcook/widgets/star.dart';

class ViewRecipePage extends StatefulWidget {
  const ViewRecipePage({super.key});

  @override
  State<ViewRecipePage> createState() => ViewRecipePageState();
}

class ViewRecipePageState extends State<ViewRecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.center,
                  height: 32,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(24)),
                      color: Colors.white),
                  child: Container(
                    height: 4,
                    width: 52,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4)),
                        color: Colors.grey.shade200),
                  ),
                )),
            pinned: true,
            stretch: true,
            onStretchTrigger: () async {
              // Triggers when stretching
            },

            // Setting [stretchTriggerOffset] to a value of 180 will trigger
            // [onStretchTrigger] when the user has overscrolled by 180 pixels.
            stretchTriggerOffset: 180.0,
            expandedHeight: 280.0,
            flexibleSpace: const FlexibleSpaceBar(
              stretchModes: [StretchMode.blurBackground],
              background: Image(
                image: AssetImage('assets/images/chicken-biryani.jpg'),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Chicken Biryani',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.left,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    StarRating(),
                    Row(
                      children: [
                        Icon(Icons.access_time_outlined),
                        Text('1hr 20mins')
                      ],
                    )
                  ]
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras odio libero, congue non felis et, egestas dapibus erat. Nullam eu turpis quis odio vestibulum fringilla. Aliquam risus dolor, elementum ac nisl dignissim, pellentesque suscipit lacus. Aliquam hendrerit accumsan lacus eu rutrum. In congue felis ex, sodales mollis sem rutrum nec. Pellentesque sit amet rutrum felis. Maecenas fermentum pharetra libero nec ullamcorper. Fusce at nibh massa. Etiam eget mauris condimentum, dapibus velit mollis, vehicula magna. Vivamus egestas felis eu risus semper dapibus. Phasellus convallis faucibus felis vitae imperdiet. Sed sodales lectus nec ante vehicula congue. Ut vitae vehicula lorem.  Fusce convallis risus nec scelerisque varius. Integer ac diam urna. Integer id dolor at orci condimentum placerat in nec risus. In aliquam, odio eu sodales ultrices, velit quam fermentum nisl, ac feugiat erat enim eu ligula. Aliquam porttitor tincidunt porta. In lacinia id nulla eu hendrerit. Vestibulum eu faucibus arcu. Cras aliquet volutpat ligula, at condimentum est mattis sit amet. Sed ultricies sem eu lorem pretium, et ultrices massa porttitor. Cras maximus diam pellentesque tristique finibus. Maecenas tincidunt purus arcu, ut pretium ante dignissim et. Pellentesque scelerisque malesuada rutrum. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum euismod, nulla ut tempus pulvinar, leo ante rhoncus urna, sed lacinia sem lectus vel neque. Mauris faucibus elit non dictum lacinia. ',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
