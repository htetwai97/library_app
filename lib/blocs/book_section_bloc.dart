import 'package:flutter/foundation.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
class BookSectionBloc extends ChangeNotifier{
  /// States
  List<BookVO?>? bookList;
  bool isDispose = false;

  /// Model
  BookModel bookModel = BookModelImpl();

  BookSectionBloc(String? listName){
    bookModel.getBooksDatabase().listen((books) {
      bookList = books;
      notifySafely();
    }).onError((error){
      debugPrint(error.toString());
    });

  }

  void saveAllBooks(List<BookVO?>? bookList) {
    bookModel.saveAllBooks(bookList);
  }

  void notifySafely() {
    if (isDispose == false) {
      notifyListeners();
    }
  }
}