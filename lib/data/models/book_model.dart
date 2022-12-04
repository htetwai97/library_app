import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/search_book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/data/vos/volume_vo.dart';
import 'package:google_ebook_app/network/responses/get_overview_list_response.dart';

abstract class BookModel {
  /// Network
  void getBookSectionNetwork(String publishDate);
  void getBooksByListNameNetwork(String listName);
  Future<List<BookVO?>?> getSearchBooks(String q);

  /// Database
  Stream<List<BookSectionVO?>?> getBookSectionDataBase();
  Stream<List<BookVO?>?> getBooksDatabase();
  Stream<List<ShelfVO?>?> getShelvesDatabase();
  Stream<ShelfVO?> getSingleShelfStream(String? shelfName);
  //Stream<List<BookVO?>?> getBooksByListNameDataBase(String listName);
  void saveAllBooks(List<BookVO?>? bookList);
  void saveAllShelves(List<ShelfVO?>? shelfList);
  void saveSingleShelf(ShelfVO? shelf);
  void deleteShelf(String? shelfName);

  /// json
  // Future<List<BookSectionVO?>?> loadJsonResponse();
  // void getBookSectionsFromLocalJson();
  // Stream<List<BookSectionVO?>?> getBookSectionsJsonDatabase();
}
