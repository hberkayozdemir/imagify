import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imagify/app/features/websites/viewmodel/websites_view_model.dart';
import 'package:imagify/app/features/websites/widgets/social_media_cart.dart';
import 'package:my_mvvm/my_mvvm.dart';

class WebSites extends StatelessWidget {
  const WebSites({super.key, required this.username});
  final String username;
  @override
  Widget build(BuildContext context) {
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
        body: ViewModelBuilder<WebSiteViewModel>.reactive(
            viewModelBuilder: () => WebSiteViewModel(),
            builder: (context, model, child) => model.isBusy
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.amber,
                    ),
                  )
                : FutureBuilder(
                    future: model.getWebsites(),
                    builder: (context, snapshot) => ListView.builder(
                        itemCount: model.websites.length,
                        
                        itemBuilder: (context, index) => SocialMediaCard(
                            model: snapshot.data![index],
                            username: username)))));
  }
}
