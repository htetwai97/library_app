import 'package:flutter/foundation.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';

class ShelfBloc extends ChangeNotifier {
  /// State
  List<BookVO?>? bookListForShelf;
  List<ShelfVO?>? shelfList;
  bool isDispose = false;
  /// Model
  BookModel bookModel = BookModelImpl();

  ShelfBloc() {
    /// Books database (only source)
    bookModel.getBooksDatabase().listen((books) {
      if(books?.isNotEmpty?? false){
        bookListForShelf =
            books?.where((element) => element?.isAddToShelve ?? false).toList();
        notifySafely();
      }
    }).onError((error) {
      debugPrint(error.toString());
    });

    /// Shelves database (only source)
    bookModel.getShelvesDatabase().listen((shelves) async {
      shelfList = shelves;
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }
  void saveAllShelves(List<ShelfVO?>? shelfList) {
    bookModel.saveAllShelves(shelfList);
    notifySafely();
  }

  void notifySafely(){
    if( isDispose== false){
      notifyListeners();
    }
  }
}
