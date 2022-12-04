import 'package:flutter/foundation.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';

class SearchBloc extends ChangeNotifier {
  /// State
  List<BookVO?>? bookList;
  bool isDispose = false;

  /// Model
  BookModel bookModel = BookModelImpl();

  SearchBloc();

  void fetchBooks(String q) {
    bookList = [];
    bookModel.getSearchBooks(q).then((books) {
      bookList = books;
      print(books?.first?.listName);
      notifySafely();
    });
  }

  void saveAllBooks(List<BookVO?>? bookList) {
    bookModel.saveAllBooks(bookList);
    notifySafely();
  }

  void notifySafely() {
    if (isDispose == false) {
      notifyListeners();
    }
  }
}
