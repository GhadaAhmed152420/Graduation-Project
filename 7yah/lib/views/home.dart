import 'package:flutter/material.dart';
import 'package:hayah_app/views/upload.dart';

import '../widgets/advices_tab.dart';
import '../widgets/home_tab.dart';
import '../widgets/navigation_drawer.dart';
import '../widgets/symptoms_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const NavigationDrawer(),
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.teal,
                  Colors.teal[200]!,
                ], begin: Alignment.bottomRight, end: Alignment.topLeft),
              ),
            ),
            title: const Text('Home'),
            centerTitle: true,
            elevation: 0.0,
            // actions: [
            //   IconButton(
            //     onPressed: (){},
            //     icon: const Icon(Icons.menu),)
            // ],
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 4,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.tips_and_updates), text: 'Advices'),
                Tab(icon: Icon(Icons.coronavirus_outlined), text: 'symptoms'),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TabBarView(
                  children: [homeTab(), advicesTab(), symptomsTab()],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UploadScreen()));
                    },
                    child: const Text(
                      'Check Now',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
