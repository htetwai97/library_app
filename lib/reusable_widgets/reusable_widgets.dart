import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_ebook_app/blocs/shelf_bloc.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/controllers/shelf_controller.dart';
import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/pages/adding_into_shelf_page.dart';
import 'package:google_ebook_app/pages/book_shelves_detail_page.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/pages/home_search_page.dart';
import 'package:google_ebook_app/pages/library_page.dart';

class BooksListAndNamesView extends StatefulWidget {
  BooksListAndNamesView({
    Key? key,
    required this.eBookOrAudioBook,
    required this.bookList,
    required this.bookSection,
    required this.onTapHeader,
    required this.onTapBook,
    required this.onPressedIcon,
  }) : super(key: key);

  int? eBookOrAudioBook;
  List<BookVO?>? bookList;
  BookSectionVO? bookSection;
  Function(BookSectionVO?) onTapHeader;
  Function(BookVO?) onTapBook;
  Function(BookVO?) onPressedIcon;
  @override
  State<BooksListAndNamesView> createState() => _BooksListAndNamesViewState();
}

class _BooksListAndNamesViewState extends State<BooksListAndNamesView> {
  BookVO? book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ReusableTextAndArrowView(
            visibleArrow: true,
            bookSection: widget.bookSection,
            onTapArrow: (bookSection) {
              widget.onTapHeader(bookSection);
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 330,
          child: ListView.builder(
            key: Key("BookListView"),
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.bookList?.length,
            itemExtent: (widget.eBookOrAudioBook == 0) ? 120 : 220,
            itemBuilder: (context, index) {
              book = widget.bookList?[index];
              return BookItemDetailView(
                onTapSeeMore: (book) {
                  widget.onPressedIcon(book);
                },
                onTapBook: (book) {
                  widget.onTapBook(book);
                },
                book: book,
              );
            },
          ),
        ),
      ],
    );
  }
}

class LineSeparatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.3,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),
    );
  }
}

class BookListGridView extends StatelessWidget {
  List<BookVO?>? bookList;
  Function(BookVO?) onTapBook;
  Function(BookVO?) onTapSeeMore;
  bool? isThreeGrid;

  BookListGridView({
    required this.onTapSeeMore,
    required this.bookList,
    required this.onTapBook,
    this.isThreeGrid = false,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 40),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookList?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: (isThreeGrid == false) ? 300 : 280,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
          crossAxisCount: (isThreeGrid == false) ? 2 : 3,
        ),
        itemBuilder: (context, index) {
          BookVO? book = bookList?[index];
          return BookItemDetailView(
            onTapSeeMore: (book) {
              onTapSeeMore(book);
            },
            isThreeGrid: isThreeGrid,
            onTapBook: (book) {
              onTapBook(book);
            },
            book: book,
          );
        });
  }
}

class BookItemDetailView extends StatelessWidget {
  BookVO? book;
  double marginInGridView;
  bool? isThreeGrid;
  Function(BookVO?) onTapBook;
  Function(BookVO?) onTapSeeMore;
  BookItemDetailView({
    this.isThreeGrid = true,
    required this.book,
    required this.onTapBook,
    required this.onTapSeeMore,
    this.marginInGridView = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginInGridView),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: GestureDetector(
                  onTap: () {
                    onTapBook(book);
                  },
                  child: Image.network(
                    book?.bookImage ?? "",
                    height: (isThreeGrid == false) ? 200 : 150,
                    width: (isThreeGrid == false)? 140: 90,
                    fit: BoxFit.fill,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              Positioned(
                child: HeadPhoneForAudioBook(
                  book: book,
                ),
                left: 10,
                bottom: 20,
              ),
              Positioned(
                child: MoreViewForEachItem(
                  onPressedIcon: (book) {
                    onTapSeeMore(book);
                  },
                  book: book,
                ),
                right: 10,
                top: 10,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            book?.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            book?.authorName ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class HeadPhoneForAudioBook extends StatelessWidget {
  HeadPhoneForAudioBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookVO? book;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 64, 66, 50),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Icon(
            Icons.headphones,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class DownloadButtonView extends StatelessWidget {
  const DownloadButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 64, 66, 50),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Icon(
          Icons.download,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

class CheckBoxOrArrowWithBookImageAndNameView extends StatefulWidget {
  List<ShelfVO?>? bookShelveList;
  ShelfBloc? bloc;
  BookVO? book;
  Function(ShelfVO?) onTapArrow;
  bool visibleArrow;
  bool visibleCheckBox;
  CheckBoxOrArrowWithBookImageAndNameView({
    required this.bookShelveList,
    required this.onTapArrow,
    this.visibleArrow = false,
    this.visibleCheckBox = false,
    this.book,
    this.bloc,
  });
  @override
  State<CheckBoxOrArrowWithBookImageAndNameView> createState() =>
      _CheckBoxOrArrowWithBookImageAndNameViewState();
}

class _CheckBoxOrArrowWithBookImageAndNameViewState
    extends State<CheckBoxOrArrowWithBookImageAndNameView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.bookShelveList?.length,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          List<ShelfVO?>? shelves = widget.bookShelveList;
          ShelfVO? shelf = shelves?[index];

          int bookLength = shelf?.shelfBooks?.length ?? 1;
          int i = bookLength - 1;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 120,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        YourShelfOverlapBookView(
                          ///           1         0
                          imageUrl: (bookLength > 1)
                              ? "${shelf?.shelfBooks?[i - 1]?.bookImage}"
                              : PLACE_HOLDER_ONE,
                        ),

                        /// upper layer image
                        Positioned(
                          right: 10,
                          child: YourShelfOverlapBookView(
                            imageUrl: (bookLength > 0)
                                ? "${shelf?.shelfBooks?[i]?.bookImage}"
                                : PLACE_HOLDER_TWO,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shelf?.shelfName ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${shelf?.shelfBooks?.length} books",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Stack(children: [
                        Visibility(
                          visible: widget.visibleCheckBox,
                          child: Checkbox(
                            tristate: true,
                            value: shelf?.isChecked,
                            onChanged: (e) {
                              setState(() {
                                shelf?.isChecked = e ?? false;
                                if (shelf?.isChecked == true) {
                                  ShelfVO? shelfIndex() {
                                    shelf?.shelfBooks?.add(widget.book);
                                    return shelf;
                                  }

                                  var shelfController = ShelfController();
                                  shelfController
                                      .catchAndSaveShelf(shelfIndex());
                                  widget.bloc?.saveAllShelves(
                                      shelfController.shelfList);
                                }
                              });
                            },
                          ),
                        ),
                        Visibility(
                          visible: widget.visibleArrow,
                          child: GestureDetector(
                            onTap: () {
                              widget.onTapArrow(shelves?[index]);
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                LineSeparatorView(),
              ],
            ),
          );
        });
  }
}

class ReusableTextAndArrowView extends StatefulWidget {
  BookSectionVO? bookSection;
  Function(BookSectionVO?) onTapArrow;
  bool visibleArrow;
  double fontSize;
  FontWeight fontWeight;
  double width;
  String? title;

  ReusableTextAndArrowView({
    this.width = 280,
    this.bookSection,
    required this.onTapArrow,
    this.visibleArrow = false,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.title = "",
  });

  @override
  State<ReusableTextAndArrowView> createState() =>
      _ReusableTextAndArrowViewState();
}

class _ReusableTextAndArrowViewState extends State<ReusableTextAndArrowView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width,
          child: Text(
            widget.bookSection?.listName ?? widget.title ?? "",
            style: TextStyle(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleArrow,
          child: GestureDetector(
            onTap: () {
              widget.onTapArrow(widget.bookSection);
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class MoreViewForEachItem extends StatelessWidget {
  BookVO? book;
  Function(BookVO?) onPressedIcon;
  Color color;
  double margin;
  MoreViewForEachItem({
    this.margin = 10,
    this.book,
    required this.onPressedIcon,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressedIcon(book);
      },
      child: Icon(
        Icons.more_horiz,
        color: color,
        size: 26,
      ),
    );
  }
}

class ShowModalSheetForBookDetail extends StatefulWidget {
  bool visibleRemoveDownload;
  bool visibleDownload;
  bool visibleDeleteFromLibrary;
  bool visibleAddToShelves;
  bool visibleMarkAsRead;
  bool visibleFreeSample;
  bool visibleAddToWishlist;
  bool visibleAboutThisBook;

  BookVO? book;
  Function(BookVO?) onPressedIcon;
  Function()? addToShelf;
  ShowModalSheetForBookDetail({
    this.addToShelf,
    required this.book,
    required this.onPressedIcon,
    this.visibleAboutThisBook = false,
    this.visibleAddToShelves = false,
    this.visibleAddToWishlist = false,
    this.visibleDeleteFromLibrary = false,
    this.visibleDownload = false,
    this.visibleFreeSample = false,
    this.visibleMarkAsRead = false,
    this.visibleRemoveDownload = false,
  });
  @override
  State<ShowModalSheetForBookDetail> createState() =>
      _ShowModalSheetForBookDetailState();
}

class _ShowModalSheetForBookDetailState
    extends State<ShowModalSheetForBookDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: BookImageAndNameBottomSheetHeader(book: widget.book),
        ),
        SizedBox(height: 10),
        LineSeparatorView(),
        SizedBox(height: 10),
        Visibility(
          visible: widget.visibleRemoveDownload,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.remove_circle_outline,
              text: "Remove downloaded",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleDownload,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.file_download_outlined,
              text: "Download",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleDeleteFromLibrary,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.delete_sharp,
              text: "Delete from your library",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleAddToShelves,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {
                widget.addToShelf!();
              },
              icon: Icons.add,
              text: "Add to shelves...",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleMarkAsRead,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.file_download_done_outlined,
              text: "Mark as read",
            ),
          ),
        ),
        // SizedBox(height: 10),
        Visibility(
          visible: widget.visibleFreeSample,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.add_comment,
              text: "Free sample",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleAddToWishlist,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.bookmark_add_sharp,
              text: "Add to wishlist",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleAboutThisBook,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.book_rounded,
              text: "About this book",
            ),
          ),
        ),
        SizedBox(height: 6),
      ],
    );
  }
}

class FunctionsOfShowModalOne extends StatelessWidget {
  Function onTap;
  String text;
  IconData icon;
  FunctionsOfShowModalOne({
    required this.icon,
    required this.text,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Icon(
            icon,
            color: Colors.black54,
            size: 22,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}

class BookAuthorImageForBottomSheet extends StatefulWidget {
  BookVO? book;
  double? imageHeight;
  double? imageWidth;
  double? titleFont;
  double? subTitleFont;
  double? sizeBoxHeight;
  bool visibleDownLoadAndSeeMore;
  Function(BookVO?) onPressedIcon;
  BookAuthorImageForBottomSheet({
    required this.book,
    this.imageHeight = 140,
    this.imageWidth = 90,
    this.titleFont = 16,
    this.subTitleFont = 14,
    this.sizeBoxHeight = 0,
    required this.visibleDownLoadAndSeeMore,
    required this.onPressedIcon,
  });

  @override
  State<BookAuthorImageForBottomSheet> createState() =>
      _BookAuthorImageForBottomSheetState();
}

class _BookAuthorImageForBottomSheetState
    extends State<BookAuthorImageForBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                widget.book?.bookImage ?? "",
                height: widget.imageHeight,
                width: widget.imageWidth,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book?.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: widget.titleFont,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    widget.book?.authorName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widget.subTitleFont,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Visibility(
            //     visible: widget.visibleDownLoadAndSeeMore,
            //     child: DownLoadAndMoreButtonForLibraryVerticalListView(
            //       onPressedIcon: (book) {
            //         widget.onPressedIcon(book);
            //       },
            //     )),
          ],
        ),
        SizedBox(height: widget.sizeBoxHeight)
      ],
    );
  }
}

class BookImageAndNameBottomSheetHeader extends StatelessWidget {
  BookVO? book;
  BookImageAndNameBottomSheetHeader({this.book});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                book?.bookImage ?? "",
                height: 140,
                width: 90,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book?.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    book?.authorName ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class DownLoadAndMoreButtonForLibraryVerticalListView extends StatefulWidget {
  Function(BookVO?) onPressedIcon;
  DownLoadAndMoreButtonForLibraryVerticalListView(
      {required this.onPressedIcon});
  @override
  State<DownLoadAndMoreButtonForLibraryVerticalListView> createState() =>
      _DownLoadAndMoreButtonForLibraryVerticalListViewState();
}

class _DownLoadAndMoreButtonForLibraryVerticalListViewState
    extends State<DownLoadAndMoreButtonForLibraryVerticalListView> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Visibility(
              visible: (isClicked == false),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = true;
                  });
                },
                child: Icon(
                  Icons.save_alt,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
            ),
            Visibility(
              visible: isClicked,
              child: Icon(
                Icons.download_done,
                size: 20,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        SizedBox(width: 10),
        MoreViewForEachItem(
          onPressedIcon: (book) {
            widget.onPressedIcon(book);
          },
          color: Colors.black54,
        ),
      ],
    );
  }
}

class RatingBarView extends StatefulWidget {
  double? rating;
  RatingBarView({this.rating = 0});

  @override
  State<RatingBarView> createState() => _RatingBarViewState();
}

class _RatingBarViewState extends State<RatingBarView> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.rating ?? 0,
      itemSize: 18,
      itemBuilder: (context, index) {
        return Icon(
          Icons.star,
          color: Colors.blueAccent,
        );
      },
      onRatingUpdate: (rating) {
        print(rating.toString());
      },
    );
  }
}

class AppBarView extends StatelessWidget {
  String? title;
  bool titleVisibility;
  bool textFieldVisibility;
  Function(String)? onSubmitted;
  AppBarView(
      {this.title,
      this.onSubmitted,
      this.titleVisibility = true,
      this.textFieldVisibility = false});
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      //color: Colors.green,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Row(
              children: [
                IconButton(
                  iconSize: 24,
                  color: Colors.black54,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Stack(
                  children: [
                    Visibility(
                      visible: titleVisibility,
                      child: Text(
                        title ?? "",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: textFieldVisibility,
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 5,
                        ),
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width / 2.6,
                        child: TextField(
                          //textInputAction: TextInputAction.search,
                          onSubmitted: (e) {
                            onSubmitted ?? (textEditingController.text);
                          },
                          controller: textEditingController,
                          decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            hintText: SEARCH_PLAY_BOOK_APP_BAR,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  spreadRadius: 0.1,
                  blurRadius: 1,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            height: 0.01,
          )
        ],
      ),
    );
  }
}

class AllInOneForLibraryAndShelfDetailView extends StatelessWidget {
  List<BookVO?>? bookList;
  List<String?>? tabList;
  String? chosenTab;
  bool? crossButtonVisible = false;
  bool? chosenTabVisible = false;
  bool isSelected = false;
  int? groupValueForView = 1;
  Function(String? tab) onTabBookTypeChooser;
  Function onTapCrossButton;
  Function(int?) onTapSortingOne;
  Function(int?) onTapSortingTwo;
  Function(int?) onTapSortingThree;
  Function(int?) onTapChooseViewOne;
  Function(int?) onTapChooseViewTwo;
  Function(int?) onTapChooseViewThree;
  Function(BookVO?) addToShelf;
  AllInOneForLibraryAndShelfDetailView({
    required this.bookList,
    required this.addToShelf,
    required this.onTapChooseViewThree,
    required this.onTapChooseViewTwo,
    required this.onTapChooseViewOne,
    required this.onTapSortingThree,
    required this.onTapSortingTwo,
    required this.onTapSortingOne,
    required this.onTapCrossButton,
    required this.onTabBookTypeChooser,
    required this.tabList,
    required this.crossButtonVisible,
    required this.chosenTab,
    required this.isSelected,
    required this.chosenTabVisible,
    required this.groupValueForView,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 1
        MultiSelectTabBarViewSection(
          chosenTabVisible: chosenTabVisible,
          crossButtonVisible: crossButtonVisible,
          chosenTab: chosenTab,
          tabList: tabList ?? [],
          onTab: (tab) {
            onTabBookTypeChooser(tab);
          },
          onTapCrossButton: () {
            onTapCrossButton();
          },
        ),
        SizedBox(height: 24),

        /// 2
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: TwoSortingButtonsInARowView(
            onTapSortOne: (e) {
              onTapSortingOne(e);
            },
            onTapSortTwo: (e) {
              onTapSortingTwo(e);
            },
            onTapSortThree: (e) {
              onTapSortingThree(e);
            },
            onTapViewOne: (e) {
              onTapChooseViewOne(e);
            },
            onTapViewTwo: (e) {
              onTapChooseViewTwo(e);
            },
            onTapViewThree: (e) {
              onTapChooseViewThree(e);
            },
          ),
        ),
        SizedBox(height: 20),

        /// 3
        (groupValueForView == 1)
            ? BooksVerticalListView(
                onTapBook: (book) {},
                onPressIcon: (book) {
                  showModalBottomSheet(
                      useRootNavigator: true,
                      isScrollControlled: false,
                      isDismissible: true,
                      enableDrag: true,
                      context: context,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      builder: (context) => ShowModalSheetForBookDetail(
                          addToShelf: () {
                            addToShelf(book);
                          },
                          visibleRemoveDownload: true,
                          visibleAboutThisBook: true,
                          visibleAddToShelves: true,
                          visibleAddToWishlist: true,
                          visibleDeleteFromLibrary: true,
                          book: book,
                          onPressedIcon: (book) {}));
                },
                visibleDownloadAndSeeMore: true,
                bookList: bookList,
              )
            : (groupValueForView == 2)
                ? BookListGridView(
                    onTapSeeMore: (book) {
                      showModalBottomSheet(
                          useRootNavigator: true,
                          isScrollControlled: false,
                          isDismissible: true,
                          enableDrag: true,
                          context: context,
                          builder: (context) => ShowModalSheetForBookDetail(
                              addToShelf: () {
                                addToShelf(book);
                              },
                              visibleRemoveDownload: true,
                              visibleAboutThisBook: true,
                              visibleAddToShelves: true,
                              visibleAddToWishlist: true,
                              visibleDeleteFromLibrary: true,
                              onPressedIcon: (book) {},
                              book: book));
                    },
                    bookList: bookList,
                    onTapBook: (book) {},
                    isThreeGrid: false,
                  )
                : BookListGridView(
                    onTapSeeMore: (book) {
                      showModalBottomSheet(
                          useRootNavigator: true,
                          isScrollControlled: false,
                          isDismissible: true,
                          enableDrag: true,
                          context: context,
                          builder: (context) => ShowModalSheetForBookDetail(
                              addToShelf: () {
                                addToShelf(book);
                              },
                              visibleRemoveDownload: true,
                              visibleAboutThisBook: true,
                              visibleAddToShelves: true,
                              visibleAddToWishlist: true,
                              visibleDeleteFromLibrary: true,
                              onPressedIcon: (book) {},
                              book: book));
                    },
                    bookList: bookList,
                    onTapBook: (book) {},
                    isThreeGrid: true,
                  ),
      ],
    );
  }
}
