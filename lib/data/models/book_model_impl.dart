import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_ebook_app/data/models/book_model.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/result_vo.dart';
import 'package:google_ebook_app/data/vos/search_book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/data/vos/volume_vo.dart';
import 'package:google_ebook_app/network/api_constants.dart';
import 'package:google_ebook_app/network/data_agents/book_data_agent.dart';
import 'package:google_ebook_app/network/data_agents/retrofit_data_agent_impl.dart';
import 'package:google_ebook_app/network/responses/get_overview_list_response.dart';
import 'package:google_ebook_app/persistance/dao_abstract/book_dao.dart';
import 'package:google_ebook_app/persistance/dao_abstract/book_section_dao.dart';
import 'package:google_ebook_app/persistance/dao_abstract/shelf_dao.dart';
import 'package:google_ebook_app/persistance/dao_impl/book_dao_impl.dart';
import 'package:google_ebook_app/persistance/dao_impl/book_section_dao_impl.dart';
import 'package:google_ebook_app/persistance/dao_impl/shelf_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';
import 'dart:convert';

class BookModelImpl extends BookModel {
  ///
  List<BookVO?>? realBooks;

  static final BookModelImpl _singleton = BookModelImpl._internal();

  factory BookModelImpl() {
    return _singleton;
  }
  BookModelImpl._internal();

  BookDataAgent bookDataAgent = RetrofitDataAgentImpl();

  /// Dao
  BookDao bookDao = BookDaoImpl();
  BookSectionDao bookSectionDao = BookSectionDaoImpl();
  ShelfDao shelfDao = ShelfDaoImpl();

  ///  Book Sections Network
  @override
  void getBookSectionNetwork(String publishDate) {
    bookDataAgent.getOverViewList(publishDate).then((bookSections) async {
      List<BookSectionVO?>? bookSectionList = bookSections?.map((section) {
        section?.bookList?.map((book) {
          book?.listName = section.listName;
          return book;
        }).toList();
        return section;
      }).toList();
      bookSectionDao.saveAllBookSection(bookSectionList);
    });
  }

  /// Book Sections Database
  @override
  Stream<List<BookSectionVO?>?> getBookSectionDataBase() {
    getBookSectionNetwork("");
    return bookSectionDao
        .getAllBookSectionsEventStream()
        .startWith(bookSectionDao.getAllBooksSectionsStream())
        .map((event) => bookSectionDao.getAllBookSections());
  }

  ///  Books by listName Network
  @override
  void getBooksByListNameNetwork(String listName) {
    bookDataAgent.getBooksByListName(listName).then((bookSections) async {
      List<BookSectionVO?>? bookSectionList = bookSections?.map((section) {
        List<BookVO?>? bookList = section?.bookDetails?.map((book) {
          book?.listName = section.listName;
          return book;
        }).toList();
        bookDao.saveAllBooks(bookList);
        print(bookList.toString());
        return section;
      }).toList();
    });
  }

  /// Search Books
  @override
  Future<List<BookVO?>?> getSearchBooks(String q) {
    return bookDataAgent.getSearchBooks(q).then((googleBookList) async {
      List<BookVO?>? books = googleBookList?.map((googleBook) {
       return googleBook?.changeToBookVO(googleBook, q);
      }).toList();
      print(books?.first?.title);
      bookDao.saveAllBooks(books);
      return books;
    });
  }

  /// ShelfList Database
  @override
  Stream<List<ShelfVO?>?> getShelvesDatabase() {
    return shelfDao
        .getAllShelvesEventStream()
        .startWith(shelfDao.getAllShelvesStream())
        .map((event) => shelfDao.getAllShelves());
  }

  /// DeleteShelf DataBase
  @override
  void deleteShelf(String? shelfName) {
    shelfDao.deleteShelf(shelfName);
  }

  /// BookList Database
  @override
  Stream<List<BookVO?>?> getBooksDatabase() {
    return bookDao
        .getAllBooksEventStream()
        .startWith(bookDao.getAllBooksStream())
        .map((event) => bookDao.getAllBooks());
  }


  /// Save books
  @override
  void saveAllBooks(List<BookVO?>? bookList) {
    bookDao.saveAllBooks(bookList);
  }

  /// Save Shelves
  @override
  void saveAllShelves(List<ShelfVO?>? shelfList) {
    shelfDao.saveAllShelves(shelfList);
  }

  @override
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName) {
    return shelfDao
        .getAllShelvesEventStream()
        .startWith(shelfDao.getSingleShelfStream(shelfName))
        .map((event) => shelfDao.getShelf(shelfName));
  }

  @override
  void saveSingleShelf(ShelfVO? shelf) {
    shelfDao.saveSingleShelf(shelf);
  }

  // /// Json Data Loading
  // @override
  // Future<List<BookSectionVO?>?> loadJsonResponse() async {
  //   // loading step
  //   final jsonData =
  //       await rootBundle.loadString("assets/fake_jsons/fake_jsons.json");
  //   //  type cast step
  //   final responseBodyFromJson = json.decode(jsonData) as Map<String, dynamic>;
  //   // BookSections call
  //   final bookSectionListFromJson =
  //       responseBodyFromJson["results"]["lists"] as List<dynamic>?;
  //   // BookSections value
  //   List<BookSectionVO?>? bookSectionsListJson =
  //       bookSectionListFromJson?.map((e) => BookSectionVO.fromJson(e)).toList();
  //   return bookSectionsListJson;
  // }
  //

// /// calling data from Json
// @override
// void getBookSectionsFromLocalJson() {
//   loadJsonResponse().then((bookSections) async {
//     List<BookSectionVO?>? bookSectionList = bookSections?.map((bookSection) {
//       bookSection?.bookList?.map((book) {
//         book?.listName = bookSection.listName;
//         return book;
//       }).toList();
//       return bookSection;
//     }).toList();
//     bookSectionDao.saveAllBookSection(bookSectionList);
//   });
// }

  //
  // /// BookSections Database (json source)
  // @override
  // Stream<List<BookSectionVO?>?> getBookSectionsJsonDatabase() {
  //   getBookSectionsFromLocalJson();
  //   Stream<List<BookSectionVO?>?> bookSections = bookSectionDao
  //       .getAllBookSectionsEventStream()
  //       .startWith(bookSectionDao.getAllBooksSectionsStream())
  //       .map((event) => bookSectionDao.getAllBookSections());
  //   return bookSections;
  // }

}
