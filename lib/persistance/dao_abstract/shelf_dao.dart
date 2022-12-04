import 'package:google_ebook_app/data/vos/shelf_vo.dart';

abstract class ShelfDao {
  /// Persistence
  void saveAllShelves(List<ShelfVO?>? shelfList);
  void saveSingleShelf(ShelfVO? shelf);
  void deleteShelf(String? shelfName);
  List<ShelfVO?>? getAllShelves();
  ShelfVO? getShelf(String? shelfName);

  /// Reactive
  Stream<void> getAllShelvesEventStream();

  Stream<List<ShelfVO?>?> getAllShelvesStream();
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName);

}
