import 'package:flutter/material.dart';

class GroceryPage extends StatefulWidget {
  const GroceryPage({super.key});

  @override
  State<GroceryPage> createState() => _GroceryPageState();
}

class _GroceryPageState extends State<GroceryPage> {
  bool checkboxValue = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          // center horizontally
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 48,
              width: MediaQuery.sizeOf(context).width * 0.75,
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search for recipes',
                    // to center hint text w/ suffix
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    fillColor: Colors.grey[200],
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade100)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300)),
                    suffixIcon: IconButton(
                        onPressed: () => (), icon: Icon(Icons.search)),
                    suffixIconColor: Colors.grey),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 8,
              width: 8,
            ),
            Ink(
              decoration: const ShapeDecoration(
                  color: Color(0xFFA5FFC5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)))),
              child:
                  IconButton(onPressed: () => (), icon: const Icon(Icons.add)),
            ),
          ],
        ),
        SingleChildScrollView(
          // container to set size of card for grocery list
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 560,
            child: Card(
              margin: EdgeInsets.all(24),
              elevation: 8,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8.0, 12.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Chicken Biryani', style: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.bold),),
                        IconButton(onPressed: () => (), icon: const Icon(Icons.edit)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                          // make listview not scrollable, prevent unbounded height
                          shrinkWrap: true,
                          itemCount: 40,
                          itemBuilder: (BuildContext context, int index) {
                            // return Row(
                            //   children: [
                            //     Text(
                            //       'data',
                            //       style: TextStyle(color: Colors.black),
                            //     )
                            //   ],
                            // );
                            return CheckboxListTile(
                              // to lead with icon, then title
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                              value: checkboxValue,
                              onChanged: (bool? value) {
                                setState(() {
                                  checkboxValue = value!;
                                });
                              },
                              title: const Text('Headline'),
                            );
                          })
                  )
              ]),
            ),
          ),
        )
      ],
    );
  }
}
