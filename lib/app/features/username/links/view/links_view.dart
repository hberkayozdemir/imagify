import 'package:dls/dls.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/features/username/links/viewmodel/Links_view_model.dart';

class LinksView extends ConsumerWidget {
  const LinksView({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context, ref) {
    final linksVM = ref.watch(linksViewModel);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffF8F3FA),
          elevation: 0,
          title: Text(
            "All website accounts",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Color(0xff1C1B1F), fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: linksVM.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              )
            : FutureBuilder(
                future: linksVM.getHistory(),
                builder: (context, snapshot) => ListView.builder(
                    itemCount: linksVM.linksList.length,
                    itemBuilder: (context, index) => SocialMediaCard(
                        description: username,
                        icon: linksVM.linksList[index].icon,
                        onCall: () => linksVM.linksList[index].onCall(username),
                        title: linksVM.linksList[index].title,
                        username: username))));
  }
}
