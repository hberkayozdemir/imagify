import 'package:dls/dls.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagify/app/features/history/view/history_view.dart';
import 'package:imagify/app/features/username/search/view/username_search.dart';

class Lander extends StatelessWidget {
  const Lander({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: Column(
        children: [
          ListTile(),
        ],
      )),
      backgroundColor: Color(0xffF8F3FA),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffF8F3FA),
        elevation: 0,
        title: Text(
          "Searchify",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: Color(0xff1C1B1F), fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Choose Image From",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.blueGrey.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomListTile(
              icon: FontAwesomeIcons.photoFilm,
              title: "Photos",
              description: "Photo which you add now from camera.",
              ontap: () {},
            ),
            CustomListTile(
              icon: FontAwesomeIcons.photoFilm,
              title: "Galery",
              description: "Image which you can add from your gallery ",
              ontap: () {},
            ),
            CustomListTile(
              icon: FontAwesomeIcons.folder,
              title: "Files",
              description: "Image which you can add from files.",
              ontap: () {},
            ),
            CustomListTile(
              icon: FontAwesomeIcons.link,
              title: "Url (link)",
              description: "We will search image url in all over internet.",
              ontap: () {},
            ),
            Text(
              "Search Username",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.blueGrey.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomListTile(
              icon: FontAwesomeIcons.user,
              title: "Username",
              description: "Username will search in all internet.",
              ontap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => UsernameSearchView())));
              },
            ),
            Text(
              "Search History",
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    color: Colors.blueGrey.shade900,
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            CustomListTile(
              icon: FontAwesomeIcons.clockRotateLeft,
              title: "Search History",
              description: "The history  show all operations in application",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => HistoryView())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
