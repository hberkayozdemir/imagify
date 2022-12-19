import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';

abstract class HistoryRepository {
  final Ref ref;
  HistoryRepository({required this.ref});
  Future<List<SearchModel>> getAllSearchHistory();
}
