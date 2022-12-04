import 'package:flutter/material.dart';
import 'package:google_ebook_app/pages/create_new_shelf_page.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/pages/library_page.dart';

class BottomIconsBarView extends StatefulWidget {
  @override
  State<BottomIconsBarView> createState() => _BottomIconsBarViewState();
}

class _BottomIconsBarViewState extends State<BottomIconsBarView> {
  int currentIndex = 0;

  late List<Widget> screens = [HomePage(), LibraryPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.library_books_outlined,
            ),
            label: "Library",
          ),
        ],
      ),
    );
  }
}
