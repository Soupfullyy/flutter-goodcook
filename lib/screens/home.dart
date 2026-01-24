import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Home',
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

              TabBar(
                indicatorColor: Color.fromARGB(255, 116, 255, 204),
                unselectedLabelColor: Colors.grey,
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
              Expanded(
                  child: TabBarView(
                controller: tabController,
                children: [
                  Text('data'),
                  Text('data'),
                ],
              ))
            ],
          )),
    );
  }
}
