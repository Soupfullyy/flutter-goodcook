import 'package:flutter/material.dart';

import '../widgets/custom_ink.dart';

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
            ),
            const SizedBox(
              width: 8,
            ),
            const CustomInk(),
          ],
        ),
        SingleChildScrollView(
          // container to set size of card for grocery list
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: 560,
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
