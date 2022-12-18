import 'package:imagify/app/core/search_engine/website_constants.dart';
import 'package:imagify/app/features/websites/websitemodel.dart';
import 'package:my_mvvm/my_mvvm.dart';

class WebSiteViewModel extends BaseViewModel {
  List<Website> websites = [];
  Future<List<Website>> getWebsites() async {
    setBusy(true);
    try {
      for (int i = 0; i <= WebsiteConstants.titles.length; i++) {
        websites.add(Website(
            title: WebsiteConstants.titles[i],
            icon: WebsiteConstants.icon[i],
            link: WebsiteConstants.websites[i]));
        notifyListeners();
      }

      setBusy(false);
    } catch (e) {}

    return websites;
  }
}
