import 'dart:async';

import 'package:imagify/app/core/initiliaze_manager/initliaze.dart';
import 'package:isar/isar.dart';

import '../storage/feature/search/search_model.dart';

class LocalStorage extends Intiliaze {
  late Future<Isar> isarS;

  LocalStorage() {
    isarS = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [SearchModelSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<List<SearchModel>> getAllSearchTypes() async {
    final isar = await isarS;
    return isar.searchModels.where().findAllSync();
  }

  Future<List<SearchModel>> getAllUserNameSearches() async {
    final isar = await isarS;
    await initialize;
    return isar.searchModels.filter().typeEqualTo("username").findAllSync();
  }

  Future<List<SearchModel>> getAllImageSearches() async {
    final isar = await isarS;
    return isar.searchModels.filter().typeEqualTo("photo").findAllSync();
  }

  FutureOr<void> addSearch(SearchModel model) async {
    final isar = await isarS;
    isar.writeTxnSync<int>(() => isar.searchModels.putSync(model));
  }

  FutureOr<void> clearAllUsernames() async {
    final isar = await isarS;
    await isar.writeTxn(() async {
      final count =
          await isar.searchModels.filter().typeEqualTo("username").deleteAll();
      print('We deleted $count recipes');
    });
  }

  @override
  FutureOr<void> initialize() {}
}
