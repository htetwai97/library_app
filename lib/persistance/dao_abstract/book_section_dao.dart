import 'package:google_ebook_app/data/vos/book_section_vo.dart';

abstract class BookSectionDao {
  /// Persistence
  void saveAllBookSection(List<BookSectionVO?>? bookSectionList);
  List<BookSectionVO?>? getAllBookSections();

  /// Reactive
  Stream<void> getAllBookSectionsEventStream();
  Stream<List<BookSectionVO?>?> getAllBooksSectionsStream();
}
