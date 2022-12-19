import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';

abstract class SearchRepository {
  final Ref ref;
  SearchRepository({required this.ref});
  Future<List<SearchModel>> getAllUsernameHistory();
  Future<bool> deleteAllUsernameHistory();
  Future<bool> addNewUsername(SearchModel model);
}
