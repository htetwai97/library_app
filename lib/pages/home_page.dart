import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_ebook_app/blocs/home_portions_bloc.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/controllers/your_book_list_controller.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/pages/book_item_detail_page.dart';
import 'package:google_ebook_app/pages/home_search_page.dart';
import 'package:google_ebook_app/pages/section_detail_page.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class HomePageRoot extends StatelessWidget {
  const HomePageRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePortionsBloc(),
      child: Container(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? eBookOrAudioBook = 0;

  @override
  void dispose() {
    var bloc = Provider.of<HomePortionsBloc>(context, listen: false);
    bloc.isDispose = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePortionsBloc(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 10,
            ),
            child: AppBarCustomDesignView(
              imageUrl:
                  "https://images.saymedia-content.com/.image/t_share/MTc0NDI5MTc5NzI1NDg5Nzk4/top-10-greatest-leonardo-dicaprio-movies.jpg",
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Selector<HomePortionsBloc, List<BookVO?>?>(
                    selector: (context, bloc) => bloc.bookList,
                    builder: (context, yourBookList, widget) {
                      List<BookVO?>? currentBooks = yourBookList
                          ?.where((element) => element?.isAddToLibrary == true)
                          .toList();
                      return (currentBooks != null)
                          ? CurrentlyReadingBookListView(
                              onPressedIcon: (book) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return ShowModalSheetForBookDetail(
                                      onPressedIcon: (book) {},
                                      book: book,
                                    );
                                  },
                                );
                              },
                              stillReadingBooks: currentBooks,
                            )
                          : Container(
                              child: Text("Add some Books for yourself"),
                            );
                    }),
                SizedBox(height: 40),
                ChoosingTabsView(
                  tabOne: "Ebooks",
                  tabTwo: "Audiobooks",
                  callBackTab: (tab) {
                    setState(() {
                      eBookOrAudioBook = tab;
                    });
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.3,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                SizedBox(height: 30),
                Selector<HomePortionsBloc, List<BookSectionVO?>?>(
                  selector: (context, bloc) => bloc.bookSectionList,
                  builder: (context, bookSections, widget) {
                    return BookSectionsForHomePageView(
                      eBookOrAudioBook: eBookOrAudioBook,
                      bookSectionList: bookSections,
                      onTapBook: (book) async {
                        var clickDate = DateTime.now();
                        BookVO? clickedBook() {
                          book?.saveDate = clickDate.toString();
                          book?.isAddToLibrary = true;
                          return book;
                        }

                        var bookListController = BookListController();
                        bookListController.addBook(clickedBook());
                        var bloc = Provider.of<HomePortionsBloc>(context,
                            listen: false);
                        bloc.saveAllBooks(bookListController.yourBookList);
                        bool result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetailPage(bookVO: book),
                          ),
                        );
                        if (result == true) {
                          setState(() {});
                        }
                      },
                      onTapHeader: (bookSection) {
                        var bloc = Provider.of<HomePortionsBloc>(context,
                            listen: false);
                        bloc.callBooksByList(bookSection?.listName ?? "");
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SectionDetailPage(
                              bookSection: bookSection,
                            ),
                          ),
                        );
                      },
                      onTapSeeMoreIcon: (book) {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) => ShowModalSheetForBookDetail(
                                visibleDownload: true,
                                visibleDeleteFromLibrary: true,
                                visibleAddToShelves: true,
                                visibleMarkAsRead: true,
                                book: book,
                                onPressedIcon: (book) {}));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookSectionsForHomePageView extends StatelessWidget {
  BookSectionsForHomePageView({
    Key? key,
    required this.eBookOrAudioBook,
    required this.bookSectionList,
    required this.onTapSeeMoreIcon,
    required this.onTapBook,
    required this.onTapHeader,
  }) : super(key: key);

  int? eBookOrAudioBook;
  List<BookSectionVO?>? bookSectionList;
  Function(BookSectionVO?) onTapHeader;
  Function(BookVO? book) onTapBook;
  Function(BookVO? book) onTapSeeMoreIcon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: Key("MainList"),
        itemCount: bookSectionList?.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return BooksListAndNamesView(
            key: Key("VerticalListSection ${index}"),
            eBookOrAudioBook: eBookOrAudioBook,
            bookList: bookSectionList?[index]?.bookList,
            bookSection: bookSectionList?[index],
            onTapHeader: (listName) {
              onTapHeader(listName);
            },
            onTapBook: (book) {
              onTapBook(book);
            },
            onPressedIcon: (book) {
              onTapSeeMoreIcon(book);
            },
          );
        });
  }
}

class CurrentlyReadingBookListView extends StatelessWidget {
  const CurrentlyReadingBookListView({
    Key? key,
    required this.stillReadingBooks,
    required this.onPressedIcon,
  }) : super(key: key);
  final List<BookVO?>? stillReadingBooks;
  final Function(BookVO?) onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {},
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
      ),
      items: stillReadingBooks?.map((currentBook) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    color: Colors.black54,
                    offset: Offset(0, 5),
                    blurRadius: 20,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image.network(
                  currentBook?.bookImage ?? "",
                  fit: BoxFit.fill,
                  width: 140,
                ),
              ),
            ),
            Positioned(
              child: HeadPhoneForAudioBook(
                book: currentBook,
              ),
              left: 10,
              bottom: 20,
            ),
            Positioned(
              child: MoreViewForEachItem(
                onPressedIcon: (book) {
                  onPressedIcon(book);
                },
                book: currentBook,
              ),
              right: 10,
              top: 10,
            ),
            Positioned(
              child: DownloadButtonView(),
              right: 10,
              bottom: 20,
            ),
          ],
        );
      }).toList(),
    );
  }
}

class ChoosingTabsView extends StatefulWidget {
  Function(int?) callBackTab;
  String? tabOne;
  String? tabTwo;
  ChoosingTabsView({
    required this.callBackTab,
    this.tabOne,
    this.tabTwo,
  });
  @override
  State<ChoosingTabsView> createState() => _ChoosingTabsViewState();
}

class _ChoosingTabsViewState extends State<ChoosingTabsView> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (tab) {
        setState(() {
          widget.callBackTab(tab);
        });
      },
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.blue,
      tabs: [
        Tab(
          text: widget.tabOne,
        ),
        Tab(
          text: widget.tabTwo,
        ),
      ],
    );
  }
}

class AppBarCustomDesignView extends StatelessWidget {
  String imageUrl;
  AppBarCustomDesignView({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 6,
          ),
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeSearchPage(),
                    ),
                  );
                },
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.width / 2.6,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: SEARCH_PLAY_BOOK_APP_BAR,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Container(
                padding: EdgeInsets.all(
                  2,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
