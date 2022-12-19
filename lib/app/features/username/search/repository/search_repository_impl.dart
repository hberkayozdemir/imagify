// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/core/logger/app_logger_impl.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';
import 'package:imagify/app/core/storage/local_storage.dart';
import 'package:imagify/app/features/username/search/repository/search_repository.dart';

final searchRepositoryProvider =
    Provider<SearchRepositoryImpl>((ref) => SearchRepositoryImpl(ref: ref));

class SearchRepositoryImpl extends SearchRepository {
  SearchRepositoryImpl({required super.ref});

  @override
  Future<bool> deleteAllUsernameHistory() async {
    try {
      await LocalStorage().clearAllUsernames.call();
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<SearchModel>> getAllUsernameHistory() async {
    try {
      final localUsernames = await LocalStorage().getAllUserNameSearches();
      AppLoggerImpl.log
          .d("Data Fetched Successfully: " + localUsernames.toString());
      return localUsernames;
    } catch (e) {
      AppLoggerImpl.log.e(e.toString());
      return [];
    }
  }

  @override
  Future<bool> addNewUsername(SearchModel model) async {
    try {
      await LocalStorage().addSearch(model);
      AppLoggerImpl.log.d("Data added Successfully: " + model.toString());
      return true;
    } catch (e) {
      AppLoggerImpl.log.e(e.toString());
      return false;
    }
  }
}
