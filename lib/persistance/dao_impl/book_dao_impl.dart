import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/persistance/dao_abstract/book_dao.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';

class BookDaoImpl extends BookDao {
  static final BookDaoImpl _singleton = BookDaoImpl._internal();

  factory BookDaoImpl() {
    return _singleton;
  }
  BookDaoImpl._internal();

  /// Persistence
  @override
  List<BookVO?>? getAllBooks() {
    return getBookBox().values.toList();
  }

  // @override
  // List<BookVO?>? getAllBooksByListName(String listName) {
  //   return getBookBox()
  //       .values
  //       .where((element) => element.listName == listName)
  //       .toList();
  // }

  @override
  void saveAllBooks(List<BookVO?>? bookList) async {
    Map<String?, BookVO> bookMap = Map.fromIterable(bookList ?? [],
        key: (book) => book.title, value: (book) => book);
    await getBookBox().putAll(bookMap);
  }

  /// Reactive

  @override
  Stream<void> getAllBooksEventStream() {
    return getBookBox().watch();
  }

  @override
  Stream<List<BookVO?>?> getAllBooksStream() {
    return Stream.value(getAllBooks());
  }

  // @override
  // Stream<List<BookVO?>?> getAllBooksByListNameStream(String listName) {
  //   return Stream.value(getAllBooksByListName(listName));
  // }

  /// Box
  Box<BookVO> getBookBox() {
    return Hive.box<BookVO>(BOX_NAME_BOOK_VO);
  }
}
