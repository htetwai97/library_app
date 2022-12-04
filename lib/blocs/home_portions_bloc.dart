import 'package:flutter/foundation.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/models/book_model_impl.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';

class HomePortionsBloc extends ChangeNotifier {
  /// States
  List<BookSectionVO?>? bookSectionList;
  List<BookVO?>? bookList;
  bool isDispose = false;

  /// Model
  BookModel bookModel = BookModelImpl();

  HomePortionsBloc() {
    /// BookSections database (from real source)
    bookModel.getBookSectionDataBase().listen((bookSections) {
      bookSectionList = bookSections;
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });

    /// Books database (only source)
    bookModel.getBooksDatabase().listen((books) {
      bookList = books;
      notifySafely();
    }).onError((error) {
      debugPrint(error.toString());
    });

    // /// BookSections database (from json source)
    // bookModel.getBookSectionsJsonDatabase().listen((bookSections) {
    //   bookSectionList = bookSections;
    //   notifySafely();
    // }).onError((error) {
    //   debugPrint(error.toString());
    // });
  }

  /// Books by List NetworkCall
  void callBooksByList(String listName){
    bookModel.getBooksByListNameNetwork(listName);
    notifySafely();
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
