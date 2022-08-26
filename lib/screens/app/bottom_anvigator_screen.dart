import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_store/screens/app/favorite_screen.dart';
import 'package:smart_store/screens/app/home_screen.dart';
import 'package:smart_store/screens/model_ui/bnscreen.dart';

class bottomanvigator extends StatefulWidget {
  const bottomanvigator({Key? key}) : super(key: key);

  @override
  State<bottomanvigator> createState() => _bottomanvigatorState();
}

class _bottomanvigatorState extends State<bottomanvigator> {
  int pageindex = 0;
  final List<Bnscreen> screen = <Bnscreen>[
    Bnscreen(title: 'SMART STORE', widget: const home_screen()),
    Bnscreen(title: 'SMART STORE', widget: const home_screen()),
    Bnscreen(title: 'Favorites Products', widget: const favorite_screen()),
    Bnscreen(title: 'SMART STORE', widget: const home_screen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey,
        title: Text(
          screen[pageindex].title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.black45,
          ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(

              decoration: BoxDecoration(
                color: Colors.blue.shade100,
              ),
              currentAccountPicture: CircleAvatar(
                radius: 35,
                backgroundImage: NetworkImage(
                  'https://media-exp1.licdn.com/dms/image/C4E03AQE8nRDY5HftVA/profile-displayphoto-shrink_800_800/0/1652103720104?e=1665014400&v=beta&t=5zINtHo2n3qYFWkrCdbCiXz6bffUeGliJGKOT2NEk88',
                ),
              ),
              accountName: Text(
                'Mohammad Albohisi',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
              accountEmail: Text(
                'mohammadalbohisi@gmail.com',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black45,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 250), () {
                  Navigator.pushNamed(context, '/view_address_screen');
                });
              },
              leading: const Icon(Icons.location_on_outlined),
              title: const Text('Addresses '),
              subtitle: Text(
                'Go to the addresses page',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 250), () {
                  Navigator.pushNamed(context, '/setting_screen');
                });
              },
              leading: const Icon(Icons.settings_outlined),
              title: const Text('settings '),
              subtitle: Text(
                'Go to the settings page',
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            )
          ],
        ),
      ),
      body: screen[pageindex].widget,
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          onTap: (int selectedPageIndex) {
            setState(() => pageindex = selectedPageIndex);
          },
          currentIndex: pageindex,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(
            color: Colors.black38,
          ),
          unselectedItemColor: Colors.black38,
          unselectedIconTheme: const IconThemeData(
            color: Colors.black38,
          ),
          elevation: 50,
          items: [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.shopping_cart),
                icon: Icon(Icons.shopping_cart_outlined),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.favorite),
                icon: Icon(Icons.favorite_border),
                label: ''),
            BottomNavigationBarItem(
                icon: Container(
                  clipBehavior: Clip.antiAlias,
                  width: 25,
                  height: 25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12.5)),
                  child: Image.asset('images/image_18.png'),
                ),
                label: ''),
          ],
        ),
      ),
    );
  }
}
