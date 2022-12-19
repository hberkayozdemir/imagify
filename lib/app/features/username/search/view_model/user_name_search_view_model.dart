// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagify/app/core/logger/app_logger_impl.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';
import 'package:imagify/app/features/username/search/repository/search_repository.dart';
import 'package:imagify/app/features/username/search/repository/search_repository_impl.dart';

final userNameSearchViewModel = Provider.autoDispose<UserNameSearchViewModel>(
    (ref) => UserNameSearchViewModel(ref: ref));

class UserNameSearchViewModel extends ChangeNotifier {
  final Ref ref;
  bool isLoading = false;
  UserNameSearchViewModel({
    required this.ref,
  }) {
    _historyRepository = ref.watch(
      searchRepositoryProvider,
    );
  }

  late SearchRepository _historyRepository;
  List<SearchModel> userNameHistorylist = [];
  Future getHistory() async {
    userNameHistorylist = [];
    try {
      isLoading = true;
      notifyListeners();
      var result = await _historyRepository.getAllUsernameHistory();
      result = result
        ..sort((a, b) {
          return b.time!.compareTo(a.time!);
        });
      userNameHistorylist.addAll(result);
    } catch (e) {
      AppLoggerImpl.log.e(e.toString());
    }
    isLoading = false;
    notifyListeners();
  }

  deleteAll() async {
    isLoading = true;
    notifyListeners();
    try {
      final result = await _historyRepository.deleteAllUsernameHistory();
      if (result) {
        userNameHistorylist = [];
      }
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }

  addNewUser(
    SearchModel model,
  ) async {
    isLoading = true;
    notifyListeners();

    try {
      await _historyRepository.addNewUsername(model);
      userNameHistorylist.add(model);
      notifyListeners();
    } catch (e) {}
    isLoading = false;
    notifyListeners();
  }
}
