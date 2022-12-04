import 'package:flutter/material.dart';
import 'package:google_ebook_app/blocs/book_section_bloc.dart';
import 'package:google_ebook_app/blocs/home_portions_bloc.dart';
import 'package:google_ebook_app/controllers/your_book_list_controller.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/pages/book_item_detail_page.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class SectionDetailPageRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BookSectionBloc(
        "Combined Print and E-Book Fiction",
      ),
      child: Container(
        child: Selector<BookSectionBloc, List<BookVO?>?>(
          selector: (context, bloc) => bloc.bookList,
          builder: (context, books, child) {
            var bloc = Provider.of<BookSectionBloc>(context, listen: false);
            return SectionDetailPage(
              bloc: bloc,
              books: books,
            );
          },
        ),
      ),
    );
  }
}

class SectionDetailPage extends StatefulWidget {
  BookSectionVO? bookSection;
  var bloc;
  List<BookVO?>? books;
  SectionDetailPage({this.bookSection, this.bloc, this.books});

  @override
  State<SectionDetailPage> createState() => _SectionDetailPageState();
}

class _SectionDetailPageState extends State<SectionDetailPage> {
  @override
  Widget build(BuildContext context) {
    List<BookVO?>? booksByList = widget.books
        ?.where((element) => element?.listName == widget.bookSection?.listName)
        .toList();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 10,
        ),
        child: AppBarView(title: widget.bookSection?.listName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookListGridView(
              onTapSeeMore: (book) {
                showModalBottomSheet(
                    context: context,
                    builder: (context) => ShowModalSheetForBookDetail(
                        visibleFreeSample: true,
                        visibleAddToWishlist: true,
                        visibleAboutThisBook: true,
                        book: book,
                        onPressedIcon: (book) {}));
              },
              onTapBook: (book) {
                var clickDate = DateTime.now();
                BookVO? clickedBook() {
                  book?.saveDate = clickDate.toString();
                  book?.isAddToLibrary = true;
                  return book;
                }
                var bookListController = BookListController();
                bookListController.addBook(clickedBook());
                var bloc = Provider.of<BookSectionBloc>(context, listen: false);
                bloc.saveAllBooks(bookListController.yourBookList);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailPage(bookVO: book),
                  ),
                );
              },
              //bookList: booksByList,
              bookList: widget.bookSection?.bookList,
            )
            //  }
            //  )
          ],
        ),
      ),
    );
  }
}
