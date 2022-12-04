import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/search_book_vo.dart';
import 'package:google_ebook_app/network/responses/get_overview_list_response.dart';

abstract class BookDataAgent {
  Future<List<BookSectionVO?>?> getOverViewList(String publishedDate);
  Future<List<BookSectionVO?>?> getBooksByListName(String listName);
  Future<List<SearchBookVO?>?> getSearchBooks(String q);
}
