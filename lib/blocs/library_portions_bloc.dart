import 'package:flutter/foundation.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';

class LibraryAndShelfPortionBloc extends ChangeNotifier {
  /// States
  List<BookVO?>? bookListForLibrary;
  List<ShelfVO?>? shelfList;
  bool isDispose = false;

  /// Model
  BookModel bookModel = BookModelImpl();

  LibraryAndShelfPortionBloc() {
    /// Books database (only source)
    bookModel.getBooksDatabase().listen((books) {
      bookListForLibrary =
          books?.where((element) => element?.isAddToLibrary ?? false).toList();
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });

    /// Shelves database (only source)
    bookModel.getShelvesDatabase().listen((shelves) {
      shelfList = shelves;
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });
  }

  void saveAllBooks(List<BookVO?>? bookList) {
    bookModel.saveAllBooks(bookList);
  }

  void saveAllShelves(List<ShelfVO?>? shelfList) {
    bookModel.saveAllShelves(shelfList);
  }

  void notifySafely() {
    if (isDispose == false) {
      notifyListeners();
    }
  }
}
