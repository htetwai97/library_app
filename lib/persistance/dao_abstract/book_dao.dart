import 'package:google_ebook_app/data/vos/book_vo.dart';

abstract class BookDao {
  /// Persistence
  void saveAllBooks(List<BookVO?>? bookList);
  List<BookVO?>? getAllBooks();
  //List<BookVO?>? getAllBooksByListName(String listName);
  /// Reactive
  Stream<void> getAllBooksEventStream();
  Stream<List<BookVO?>?> getAllBooksStream();
  //Stream<List<BookVO?>?> getAllBooksByListNameStream(String listName);
}
