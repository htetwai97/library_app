import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';

class ShelfController {
  List<ShelfVO?>? shelfList = [];

  void catchAndSaveShelf(ShelfVO? shelf) {
    shelfList?.add(shelf);
  }
}
