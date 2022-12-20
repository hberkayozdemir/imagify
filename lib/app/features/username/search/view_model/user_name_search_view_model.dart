// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imagify/app/core/logger/app_logger_impl.dart';
import 'package:imagify/app/core/storage/feature/search/search_model.dart';
import 'package:imagify/app/features/username/search/repository/search_repository.dart';
import 'package:imagify/app/features/username/search/repository/search_repository_impl.dart';

class UsernameSearchViewModel extends StateNotifier<List<SearchModel>> {
  final Ref ref;
  bool isLoading = false;
  UsernameSearchViewModel({
    required this.ref,
  }) : super([]) {
    _historyRepository = ref.watch(
      searchRepositoryProvider,
    );
  }

  late SearchRepository _historyRepository;
  Future getHistory() async {
    try {
      isLoading = true;
      var result = await _historyRepository.getAllUsernameHistory();
      result = result
        ..sort((a, b) {
          return b.time!.compareTo(a.time!);
        });

      state.addAll(result);
    } catch (e) {
      AppLoggerImpl.log.e(e.toString());
    }
    isLoading = false;
  }

  deleteAll() async {
    isLoading = true;
    try {
      final result = await _historyRepository.deleteAllUsernameHistory();
      if (result) {
        state = [];
      }
    } catch (e) {}
    isLoading = false;
  }

  addNewUser(
    SearchModel model,
  ) async {
    isLoading = true;

    try {
      await _historyRepository.addNewUsername(model);
      state = [...state, model];
    } catch (e) {}
    isLoading = false;
  }
}

final userNameSearchViewModel =
    StateNotifierProvider<UsernameSearchViewModel, List<SearchModel>>((ref) {
  return UsernameSearchViewModel(ref: ref);
});
