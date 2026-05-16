import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedMouseProjectProvider extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void updateIndex({required int index}) {
    state = index;
  }

  void clear() {
    state = -1;
  }
}

final selectedMouseProjectProvider =
    NotifierProvider<SelectedMouseProjectProvider, int>(
      SelectedMouseProjectProvider.new,
    );
