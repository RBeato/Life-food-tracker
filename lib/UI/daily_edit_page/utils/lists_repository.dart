abstract class ListsRepository {
  Future<void> init();
  Future<Map<String, List>> getItemsLists();
  Future<void> addItem();
  Future<void> removeItem();
  Future<void> dispose();
}
