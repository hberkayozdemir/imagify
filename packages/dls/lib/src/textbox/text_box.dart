import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextBox extends StatelessWidget {
  const TextBox({super.key, required this.title, required this.description});
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.roboto(
                height: 2.4,
                textStyle: TextStyle(fontSize: 16.0, color: Color(0xff1C1B1F))),
          ),
          AutoSizeText(
            description,
            maxLines: 2,
            style: GoogleFonts.roboto(
                textStyle: TextStyle(
                    height: 2,
                    wordSpacing: 0.25,
                    fontSize: 14.0,
                    color: Color(0xff49454F))),
          )
        ],
      ),
    );
  }
}
