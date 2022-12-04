import 'package:google_ebook_app/data/vos/book_vo.dart';

class BookListController{
  List<BookVO?>? yourBookList = [];

  void addBook (BookVO? book){
    yourBookList?.add(book);
  }

  @override
  String toString() {
    return 'BookListController{yourBookList: $yourBookList}';
  }
}