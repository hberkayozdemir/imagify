import 'package:dls/dls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/features/history/view_model/history_view_model.dart';
import 'package:imagify/app/features/username/search/view/username_search.dart';

class HistoryView extends ConsumerWidget {
  const HistoryView({super.key});

  @override
  @override
  Widget build(BuildContext context, ref) {
    final historyVM = ref.watch(historyViewModel);
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(0xffF8F3FA),
          elevation: 0,
          title: Text(
            "Your All Recent Transictions",
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                  color: Color(0xff1C1B1F), fontWeight: FontWeight.w600),
            ),
          ),
        ),
        body: historyVM.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.amber,
                ),
              )
            : FutureBuilder(
                future: historyVM.getHistory(),
                builder: (context, snapshot) => ListView.builder(
                    itemCount: historyVM.historyList.length,
                    itemBuilder: (context, index) => SocialMediaCard(
                        description: historyVM.historyList[index].type ?? "",
                        icon: _getIconData(historyVM.historyList[index].type!),
                        onCall: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => UsernameSearchView(
                                        username:
                                            historyVM.historyList[index].title,
                                      )));
                        },
                        title: historyVM.historyList[index].title ?? "",
                        username:
                            historyVM.historyList[index].time.toString()))));
  }

  IconData _getIconData(String type) {
    switch (type) {
      case "username":
        return FontAwesomeIcons.user;
      case "image":
        return FontAwesomeIcons.photoFilm;
      default:
        return FontAwesomeIcons.user;
    }
  }
}
