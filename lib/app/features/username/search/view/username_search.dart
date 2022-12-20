import 'package:dls/dls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';
import 'package:imagify/app/features/username/links/view/links_view.dart';
import 'package:imagify/app/features/username/search/view_model/user_name_search_view_model.dart';

class UsernameSearchView extends ConsumerWidget {
  const UsernameSearchView({super.key, this.username});
  final String? username;
  @override
  Widget build(BuildContext context, ref) {
    final control = TextEditingController(text: username);
    List<SearchModel> userNameSearchVM = ref.watch(userNameSearchViewModel);
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
                  onSubmit: ((value) => _onSubmit(value, context, ref)),
                  controller: control),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Recent Searches...",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          color: Colors.blueGrey.shade900,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        ref.read(userNameSearchViewModel.notifier).deleteAll();
                      },
                      child: Text(
                        "Clear",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: userNameSearchVM.length,
                    shrinkWrap: true,
                    cacheExtent: 100,
                    itemExtent: 120,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomListTile(
                          icon: FontAwesomeIcons.user,
                          title: userNameSearchVM[index].title ?? "username",
                          description: userNameSearchVM[index].time.toString(),
                          ontap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => LinksView(
                                        username:
                                            userNameSearchVM[index].title ??
                                                "username",
                                      )),
                            );
                          });
                    }),
              )
            ],
          ),
        ));
  }

  void _onSubmit(String value, BuildContext context, WidgetRef ref) async {
    final resultModel = SearchModel()
      ..time = DateTime.now()
      ..title = value
      ..type = "username";
    await ref.read(userNameSearchViewModel.notifier).addNewUser(resultModel);
    Navigator.push(
      context,
      CupertinoPageRoute(
          builder: (context) => LinksView(
                username: value,
              )),
    );
  }
}
