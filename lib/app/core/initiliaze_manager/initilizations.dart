// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:imagify/app/core/storage/local_storage.dart';

import 'initliaze.dart';

class Initilizations {
  Initilizations();
  List<Intiliaze> features = [LocalStorage()];

  void launch() async {
    for (Intiliaze feature in features) {
      feature.initialize();
    }
  }
}
