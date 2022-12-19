import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaCard extends StatefulWidget {
  const SocialMediaCard(
      {super.key,
      required this.onCall,
      required this.icon,
      required this.username,
      required this.title,
      required this.description});

  final VoidCallback onCall;
  final String username, title, description;
  final IconData icon;
  @override
  State<SocialMediaCard> createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
  late bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            isTapped = true;
          });
          widget.onCall();
        },
        child: Container(
          margin: const EdgeInsets.all(12),
          child: SizedBox(
              height: 88,
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xff1C1B1F),
                        blurRadius: isTapped ? 2 : 0.50,
                      )
                    ],
                    border:
                        Border.all(color: const Color(0xffCAC3D0), width: 0.5),
                    color: const Color(0xffFFFBFE)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        flex: 5,
                        child: TextedIcon(
                          description: widget.username,
                          title: widget.title,
                          icon: widget.icon,
                        )),
                    Flexible(
                      flex: 2,
                      child: imagebanner(),
                    )
                  ],
                ),
              )),
        ));
  }

  Widget imagebanner() {
    return const SizedBox.expand(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(12), topRight: Radius.circular(12)),
          color: Color(0xffEADDFF),
        ),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.user,
            size: 35,
            color: Color(0xff21005D),
          ),
        ),
      ),
    );
  }
}

class TextedIcon extends StatelessWidget {
  const TextedIcon({
    required this.icon,
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String title, description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xffEADDFF),
            child: FaIcon(
              icon,
              color: const Color(0xff21005D),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.roboto(
                    height: 1.4,
                    textStyle: const TextStyle(
                        fontSize: 16.0, color: Color(0xff1C1B1F))),
              ),
              AutoSizeText(
                description,
                maxLines: 2,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        height: 1,
                        wordSpacing: 0.25,
                        fontSize: 14.0,
                        color: Color(0xff49454F))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
