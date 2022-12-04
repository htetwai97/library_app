import 'package:flutter/foundation.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';

class ShelfDetailBloc extends ChangeNotifier {
  /// State
  ShelfVO? shelf;
  bool isDispose = false;

  /// Model
  BookModel bookModel = BookModelImpl();

  ShelfDetailBloc(String shelfName) {
    bookModel.getSingleShelfStream(shelfName).listen((shelfVo) {
      shelf = shelfVo;
      notifySafely();
      print(shelfVo.toString());
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void deleteShelf(String? shelfName) {
    bookModel.deleteShelf(shelfName);
    notifySafely();
  }

  void saveAllShelves(List<ShelfVO?>? shelfList) {
    bookModel.saveAllShelves(shelfList);
    notifySafely();
  }

  void notifySafely() {
    if (isDispose == false) {
      notifyListeners();
    }
  }
}
