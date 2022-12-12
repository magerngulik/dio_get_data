import 'package:uas/Screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:uas/Screens/rating_screens.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  //Menampilkan widget
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    RatingScreens(),
    const Text('Search'),
    const Text('Profile'),
    const Text('Pengaturan')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions[_selectedIndex]),
      //BottomNavigationBar untuk menampilkan bagian bawah aplikasi
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10, //mengatur ketinggian
        showSelectedLabels:
            false, //menampilkan label teks bernilai true (dibawah icon ada teks), jika false maka tidak ditampilkan
        type: BottomNavigationBarType
            .fixed, //pergerakan icon ketika tombol dipencet, jika fixed menetap, shifting bergeser
        showUnselectedLabels:
            false, //ketika icon dipencet, jika true icon yang ditekan tidak ada ket. label tp icon yg lain ada, dan jk false semua tidak ada ket.label
        selectedItemColor: const Color(0xFF526799),
        unselectedItemColor: const Color(0xFF526799),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_home_regular), //ikon ketika sebelum ditekan
            activeIcon: Icon(FluentSystemIcons
                .ic_fluent_home_filled), //ikon ketika setelah ditekan
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons
                .ic_fluent_bookmark_regular), //ikon ketika sebelum ditekan
            activeIcon: Icon(FluentSystemIcons
                .ic_fluent_bookmark_filled), //ikon ketika setelah ditekan
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_search_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_person_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(FluentSystemIcons.ic_fluent_settings_regular),
            activeIcon: Icon(FluentSystemIcons.ic_fluent_settings_filled),
            label: "Pengaturan",
          ),
        ],
      ),
    );
  }
}
