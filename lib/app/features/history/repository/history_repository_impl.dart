// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';
import 'package:imagify/app/core/storage/local_storage.dart';
import 'package:imagify/app/features/history/repository/history_repository.dart';

final historyRepoProvider =
    Provider<HistoryRepositoryImpl>((ref) => HistoryRepositoryImpl(ref: ref));

class HistoryRepositoryImpl extends HistoryRepository {
  HistoryRepositoryImpl({required super.ref});
  Future<List<SearchModel>> getAllSearchHistory() async {
    try {
      final localSearchHistory = await LocalStorage().getAllSearchTypes();

      debugPrint(localSearchHistory.toString());
      debugPrint("All History called");
      localSearchHistory
        ..sort((a, b) {
          return b.time!.compareTo(a.time!);
        });
      return localSearchHistory;
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
