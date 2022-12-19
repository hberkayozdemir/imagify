// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagify/app/core/logger/app_logger_impl.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';
import 'package:imagify/app/features/history/repository/history_repository.dart';
import 'package:imagify/app/features/history/repository/history_repository_impl.dart';

final historyViewModel =
    Provider<HistoryViewModel>((ref) => HistoryViewModel(ref: ref));

class HistoryViewModel extends ChangeNotifier {
  final Ref ref;
  bool isLoading = false;
  HistoryViewModel({
    required this.ref,
  }) {
    _historyRepository = ref.watch(historyRepoProvider);
  }

  late HistoryRepository _historyRepository;
  List<SearchModel> historyList = [];
  getHistory() async {
    historyList = [];
    try {
      isLoading = true;
      notifyListeners();
      historyList.addAll(await _historyRepository.getAllSearchHistory());
    } catch (e) {
      AppLoggerImpl.log.e(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }
}
