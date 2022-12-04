import 'package:flutter/material.dart';
import 'package:google_ebook_app/blocs/search_bloc.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/controllers/your_book_list_controller.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/pages/book_item_detail_page.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class HomeSearchPage extends StatefulWidget {
  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  int? ebookOrAudioBook = 0;
  TextEditingController textEditingController = TextEditingController();

  late SearchBloc myBloc;
  @override
  void initState() {
    myBloc = SearchBloc();
    super.initState();
  }

  @override
  void dispose() {
    myBloc.isDispose = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchBloc>.value(
      value: myBloc,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context,true);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black54,
                )),
            title: ChangeNotifierProvider.value(
              value: myBloc,
              child: TextField(
                controller: textEditingController,
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  hintText: SEARCH_PLAY_BOOK_APP_BAR,
                ),
                onSubmitted: (text) {
                  myBloc.fetchBooks(text);
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ChoosingTabsView(
                    tabOne: "Ebooks",
                    tabTwo: "Audiobooks",
                    callBackTab: (tab) {
                      setState(() {
                        ebookOrAudioBook = tab;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ReusableTextAndArrowView(
                      bookSection: null,
                      visibleArrow: false,
                      onTapArrow: (title) {}),
                ),
                SizedBox(height: 20),
                Visibility(
                  child: Selector<SearchBloc, List<BookVO?>?>(
                    selector: (context, bloc) => bloc.bookList,
                    builder: (context, books, child) {
                      if (books == null) {
                        return Container(
                          color: Colors.green,
                        );
                      }
                      if (books.isEmpty) {
                        return CircularProgressIndicator();
                      }
                      return BooksVerticalListView(
                        onTapBook: (book) {
                          var clickDate = DateTime.now();
                          BookVO? clickedBook() {
                            book?.saveDate = clickDate.toString();
                            book?.isAddToLibrary = true;
                            return book;
                          }

                          var bookListController = BookListController();
                          bookListController.addBook(clickedBook());
                          var bloc =
                              Provider.of<SearchBloc>(context, listen: false);
                          bloc.saveAllBooks(bookListController.yourBookList);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BookDetailPage(bookVO: book),
                            ),
                          );
                        },
                        onPressIcon: (book) {},
                        visibleDownloadAndSeeMore: false,
                        bookList: books,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BooksVerticalListView extends StatefulWidget {
  BooksVerticalListView({
    Key? key,
    this.bookList,
    required this.visibleDownloadAndSeeMore,
    required this.onPressIcon,
    required this.onTapBook,
  }) : super(key: key);

  BookVO? bookVO;
  bool visibleDownloadAndSeeMore;
  final List<BookVO?>? bookList;
  Function(BookVO?) onPressIcon;
  Function(BookVO?) onTapBook;
  @override
  State<BooksVerticalListView> createState() => _BooksVerticalListViewState();
}

class _BooksVerticalListViewState extends State<BooksVerticalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        itemCount: widget.bookList?.length,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onTapBook(widget.bookList?[index]);
            },
            child: BookAuthorImageForBottomSheet(
              onPressedIcon: (book) {
                widget.bookVO = widget.bookList?[index];
                widget.onPressIcon(widget.bookVO);
              },
              titleFont: 14,
              subTitleFont: 12,
              visibleDownLoadAndSeeMore: widget.visibleDownloadAndSeeMore,
              imageWidth: 60,
              imageHeight: 90,
              book: widget.bookList?[index],
              sizeBoxHeight: 20,
            ),
          );
        });
  }
}
