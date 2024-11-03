import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_planner/add_new_page.dart';
import 'package:workout_planner/favourites_page.dart';
import 'package:workout_planner/home_page.dart';
import 'package:workout_planner/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _page = [
    const HomePage(),
    const AddNewPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.blue,
          textTheme: GoogleFonts.interTextTheme(
            Theme.of(context).textTheme,
          )),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                label: "Add"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                ),
                label: "Favourites"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Profile"),
          ],
        ),
        body: _page[_currentIndex],
      ),
    );
  }
}
