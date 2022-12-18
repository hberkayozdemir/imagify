import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagify/app/features/username_search/widget/search_text_field.dart';
import 'package:imagify/app/features/websites/websites.dart';

final control = TextEditingController();

class UsernameSearchView extends StatefulWidget {
  const UsernameSearchView({super.key});

  @override
  State<UsernameSearchView> createState() => _UsernameSearchViewState();
}

class _UsernameSearchViewState extends State<UsernameSearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color(0xffF8F3FA),
        elevation: 0,
        title: Text(
          "Search Username",
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
                color: Color(0xff1C1B1F), fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTextField(
                  onChanged: (value) => null,
                  onSubmit: ((value) => Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => WebSites(
                                  username: value,
                                )),
                      )),
                  controller: control),
              SizedBox(
                height: 10,
              ),
              Text(
                "Your Recent Searches...",
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
            ]),
      ),
    );
  }
}
