import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifestyle_tracker/UI/daily_edit_page/utils/items_list_repository.dart';

import '../../../constants.dart';
import 'lists_repository.dart';

final itemsListsProvider =
    Provider<ListsRepository>((ref) => ItemsListRepository());

final itemsNotifierProvider = StateNotifierProvider<UserEditItemsListsNotifier,
        AsyncValue<Map<String, List>>>(
    (ref) => UserEditItemsListsNotifier(ref.read));

class UserEditItemsListsNotifier
    extends StateNotifier<AsyncValue<Map<String, List>>> {
  UserEditItemsListsNotifier(this.read,
      [AsyncValue<Map<String, List>>? allItems])
      : super(allItems ?? const AsyncValue.loading()) {
    retrieveItems();
  }

  final Reader read;
  AsyncValue<Map<String, List>>? previousState;

  Future<void> retrieveItems() async {
    try {
      // final itemsLists = await read(itemsListsProvider)
      //     .getItemsLists(); //if empty get original lists
      final itemsLists = Constants.allItems;
      state = AsyncValue.data(itemsLists);
    } catch (e) {
      print(e);
    }
  }

  Future<void> add(String item, String parameter) async {
    _cacheState();
    try {
      Map<String, List> itemsLists = state.value!;
      itemsLists[parameter]!.add(item);
      state = itemsLists as AsyncValue<Map<String, List>>;
    } catch (e) {
      print(e);
    }
  }

  Future<void> remove(String item, String parameter) async {
    _cacheState();
    try {
      Map<String, List> itemsLists = state.value!;
      itemsLists[parameter]!.removeWhere((element) => element == item);
      state = itemsLists as AsyncValue<Map<String, List>>;
      state = itemsLists as AsyncValue<Map<String, List>>;
    } catch (e) {
      print(e);
    }
  }

  void _cacheState() {
    previousState = state;
  }
}
