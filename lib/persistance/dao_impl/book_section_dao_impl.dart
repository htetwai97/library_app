import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/persistance/dao_abstract/book_section_dao.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookSectionDaoImpl extends BookSectionDao {
  static final BookSectionDaoImpl _singleton = BookSectionDaoImpl._internal();

  factory BookSectionDaoImpl() {
    return _singleton;
  }
  BookSectionDaoImpl._internal();

  /// Persistence
  @override
  List<BookSectionVO?>? getAllBookSections() {
    return getBookSectionBox().values.toList();
  }


  @override
  void saveAllBookSection(List<BookSectionVO?>? bookSectionList) async {
    Map<int?, BookSectionVO> bookSectionMap = Map.fromIterable(
        bookSectionList ?? [],
        key: (bookSection) => bookSection.listId,
        value: (bookSection) => bookSection);
    await getBookSectionBox().putAll(bookSectionMap);
  }

  /// Reactive
  @override
  Stream<void> getAllBookSectionsEventStream() {
    return getBookSectionBox().watch();
  }

  @override
  Stream<List<BookSectionVO?>?> getAllBooksSectionsStream() {
    return Stream.value(getAllBookSections());
  }

  /// Box
  Box<BookSectionVO> getBookSectionBox() {
    return Hive.box<BookSectionVO>(BOX_NAME_BOOK_SECTION_VO);
  }
}
