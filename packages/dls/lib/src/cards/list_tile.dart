import 'package:dls/dls.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.ontap,
  });

  final IconData icon;
  final String title, description;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Color(
          0xffFFFBFE,
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
              child: IconButton(
                onPressed: ontap,
                icon: CircleAvatar(
                    backgroundColor: const Color(0xffEADDFF),
                    radius: 50,
                    child: FaIcon(
                      size: 15,
                      icon,
                      color: const Color(0xff21005D),
                    )),
              ),
            ),
            TextBox(title: title, description: description),
          ],
        ),
      ),
    );
  }
}
