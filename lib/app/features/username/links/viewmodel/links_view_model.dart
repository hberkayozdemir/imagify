// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagify/app/core/logger/app_logger_impl.dart';
import 'package:imagify/app/core/search_engine/website_constants.dart';
import 'package:imagify/app/features/username/links/model/links_model.dart';

final linksViewModel =
    Provider<LinksViewModel>((ref) => LinksViewModel(ref: ref));

class LinksViewModel extends ChangeNotifier {
  final Ref ref;
  bool isLoading = false;
  LinksViewModel({
    required this.ref,
  }) {}

  List<Links> linksList = [];
  getHistory() async {
    linksList = [];
    isLoading = true;
    try {
      for (int i = 0; i <= WebsiteConstants.titles.length; i++) {
        linksList.add(Links(
            title: WebsiteConstants.titles[i],
            icon: WebsiteConstants.icon[i],
            link: WebsiteConstants.websites[i]));
      }
      notifyListeners();
    } catch (e) {
      AppLoggerImpl.log.e(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
