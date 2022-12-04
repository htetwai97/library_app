import 'package:flutter/material.dart';
import 'package:google_ebook_app/blocs/home_portions_bloc.dart';
import 'package:google_ebook_app/blocs/library_portions_bloc.dart';
import 'package:google_ebook_app/controllers/shelf_controller.dart';
import 'package:google_ebook_app/controllers/your_book_list_controller.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/pages/adding_into_shelf_page.dart';
import 'package:google_ebook_app/pages/book_shelves_detail_page.dart';
import 'package:google_ebook_app/pages/create_new_shelf_page.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/pages/home_search_page.dart';
import 'package:google_ebook_app/reusable_widgets/already_created_bookshelves_list.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class LibraryPage extends StatefulWidget {
  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  late List<String?>? tabList;
  int? booksOrShelves = 0;
  String? chosenTab;
  bool? crossButtonVisible = false;
  bool? chosenTabVisible = false;
  bool isSelected = false;
  int? groupValueForView = 1;
  int? groupValueForSort = 1;

  late LibraryAndShelfPortionBloc myBloc;

  @override
  void initState() {
    myBloc = LibraryAndShelfPortionBloc();
    super.initState();
  }

  @override
  void dispose() {
    myBloc.isDispose = true;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryAndShelfPortionBloc>.value(
      value: myBloc,
      child: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
            visible: (booksOrShelves == 1),
            child: CreateNewShelfButtonView(
              onTapCreateNew: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNewShelfPage()));
              },
            ),
          ),
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 10,
            ),
            child: AppBarCustomDesignView(
                imageUrl:
                    "https://images.saymedia-content.com/.image/t_share/MTc0NDI5MTc5NzI1NDg5Nzk4/top-10-greatest-leonardo-dicaprio-movies.jpg"),
          ),
          body: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 10),
              ChoosingTabsView(
                callBackTab: (tab) {
                  setState(() {
                    booksOrShelves = tab;
                  });
                },
                tabOne: "Your books",
                tabTwo: "Your shelves",
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.3,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              SizedBox(height: 20),
              (booksOrShelves == 0)
                  ? Selector<LibraryAndShelfPortionBloc, List<BookVO?>?>(
                      selector: (context, bloc) => bloc.bookListForLibrary,
                      builder: (context, yourBooks, child) {
                        if(yourBooks?.isNotEmpty?? false){
                          if (groupValueForSort == 1) {
                            yourBooks?.sort((a, b) => b!.saveDate
                                .toString()
                                .compareTo(a!.saveDate.toString()));
                          } else if (groupValueForSort == 2) {
                            yourBooks?.sort((a, b) => a!.title
                                .toString()
                                .toLowerCase()
                                .compareTo(b!.title.toString().toLowerCase()));
                          } else {
                            yourBooks?.sort((a, b) => a!.authorName
                                .toString()
                                .toLowerCase()
                                .compareTo(
                                b!.authorName.toString().toLowerCase()));
                          }
                        }

                        List<BookVO?>? userBooks;
                        if (isSelected == false) {
                          userBooks = yourBooks;
                        } else {
                          userBooks = yourBooks
                              ?.where(
                                  (element) => element?.listName == chosenTab)
                              .toList();
                        }

                        tabList = yourBooks
                            ?.map((book) {
                              return book?.listName;
                            })
                            .toList()
                            .toSet()
                            .toList();

                        return AllInOneForLibraryAndShelfDetailView(
                          bookList: userBooks,
                          addToShelf: (book) {
                            BookVO? clickedBook() {
                              book?.isAddToShelve = true;
                              return book;
                            }

                            var bookListController = BookListController();
                            bookListController.addBook(clickedBook());
                            var blocHome =
                                Provider.of<LibraryAndShelfPortionBloc>(context,
                                    listen: false);
                            blocHome
                                .saveAllBooks(bookListController.yourBookList);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AddingIntoShelfPage(book: book)));
                          },
                          onTapChooseViewThree: (e) {
                            setState(() {
                              groupValueForView = e;
                            });
                          },
                          onTapChooseViewTwo: (e) {
                            setState(() {
                              groupValueForView = e;
                            });
                          },
                          onTapChooseViewOne: (e) {
                            setState(() {
                              groupValueForView = e;
                            });
                          },
                          onTapSortingThree: (e) {
                            setState(() {
                              groupValueForSort = e;
                            });
                          },
                          onTapSortingTwo: (e) {
                            setState(() {
                              groupValueForSort = e;
                            });
                          },
                          onTapSortingOne: (e) {
                            setState(() {
                              groupValueForSort = e;
                            });
                          },
                          onTapCrossButton: () {
                            setState(() {
                              crossButtonVisible = false;
                              chosenTabVisible = false;
                              isSelected = false;
                            });
                          },
                          onTabBookTypeChooser: (tab) {
                            setState(() {
                              chosenTab = tab;
                              chosenTabVisible = true;
                              crossButtonVisible = true;
                              isSelected = true;
                            });
                          },
                          tabList: tabList,
                          crossButtonVisible: crossButtonVisible,
                          chosenTab: chosenTab,
                          isSelected: isSelected,
                          chosenTabVisible: chosenTabVisible,
                          groupValueForView: groupValueForView,
                        );
                      },
                    )
                  : Selector<LibraryAndShelfPortionBloc, List<ShelfVO?>?>(
                      selector: (context, bloc) => bloc.shelfList,
                      builder: (context, shelves, child) {
                        return CheckBoxOrArrowWithBookImageAndNameView(
                          onTapArrow: (bookShelf) async {
                            bool? update = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BookShelvesDetailPage(
                                          nameToRemoveShelf:
                                              bookShelf?.shelfName,
                                          shelf: bookShelf,
                                        )));
                            if (update == true) {
                              setState(() {});
                            }
                          },
                          visibleArrow: true,
                          visibleCheckBox: false,
                          bookShelveList: shelves,
                        );
                      },
                    )
            ],
          )),
        ),
      ),
    );
  }
}

class CreateNewShelfButtonView extends StatelessWidget {
  Function onTapCreateNew;
  CreateNewShelfButtonView({required this.onTapCreateNew});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCreateNew();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 20),
        height: 46,
        width: 106,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 8),
              blurRadius: 1000,
              blurStyle: BlurStyle.inner,
              spreadRadius: 0,
            )
          ],
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.drive_file_rename_outline,
              color: Colors.white,
              size: 18,
            ),
            Text(
              "Create New",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TwoSortingButtonsInARowView extends StatefulWidget {
  Function(int?) onTapViewOne;
  Function(int?) onTapViewTwo;
  Function(int?) onTapViewThree;
  Function(int?) onTapSortOne;
  Function(int?) onTapSortTwo;
  Function(int?) onTapSortThree;

  String viewTextOne;
  String viewTextTwo;
  String viewTextThree;
  String sortTextOne;
  String sortTextTwo;
  String sortTextThree;
  String viewHeading;
  String sortHeading;

  TwoSortingButtonsInARowView({
    required this.onTapViewThree,
    required this.onTapViewTwo,
    required this.onTapViewOne,
    required this.onTapSortOne,
    required this.onTapSortThree,
    required this.onTapSortTwo,
    this.sortHeading = "Sort by",
    this.sortTextOne = "Recently opened",
    this.sortTextThree = "Author",
    this.sortTextTwo = "Title",
    this.viewHeading = "View as",
    this.viewTextOne = "List",
    this.viewTextThree = "Small grid",
    this.viewTextTwo = "Large grid",
  });

  @override
  State<TwoSortingButtonsInARowView> createState() =>
      _TwoSortingButtonsInARowViewState();
}

class _TwoSortingButtonsInARowViewState
    extends State<TwoSortingButtonsInARowView> {
  String? selectedSorting = "";

  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SortingBookListViewShowModal(
                textOne: widget.sortTextOne,
                textTwo: widget.sortTextTwo,
                textThree: widget.sortTextThree,
                heading: widget.sortHeading,

                /// e is already groupValue
                onTapViewOne: (e) {
                  setState(() {
                    widget.onTapSortOne(e);
                    groupValue = e;
                  });
                },
                onTapViewTwo: (e) {
                  setState(() {
                    widget.onTapSortTwo(e);
                    groupValue = e;
                  });
                },
                onTapViewThree: (e) {
                  setState(() {
                    widget.onTapSortThree(e);
                    groupValue = e;
                  });
                },
              ),
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.sort_outlined,
                size: 24,
              ),
              SizedBox(width: 2),
              Text(
                "${widget.sortHeading}: ",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                (groupValue == 1)
                    ? widget.sortTextOne
                    : (groupValue == 2)
                        ? widget.sortTextTwo
                        : (groupValue == 3)
                            ? widget.sortTextThree
                            : "",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SortingBookListViewShowModal(
                textOne: widget.viewTextOne,
                textTwo: widget.viewTextTwo,
                textThree: widget.viewTextThree,
                heading: widget.viewHeading,

                /// e is already groupValue
                onTapViewThree: (e) {
                  widget.onTapViewOne(e);
                },
                onTapViewTwo: (e) {
                  widget.onTapViewTwo(e);
                },
                onTapViewOne: (e) {
                  widget.onTapViewThree(e);
                },
              ),
            );
          },
          child: Icon(
            Icons.window,
            size: 20,
          ),
        )
      ],
    );
  }
}

class SortingBookListViewShowModal extends StatefulWidget {
  String heading;
  String textOne;
  String textTwo;
  String textThree;

  int? groupValue = 0;
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;

  Function(int?) onTapViewOne;
  Function(int?) onTapViewTwo;
  Function(int?) onTapViewThree;
  SortingBookListViewShowModal({
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.heading,
    required this.onTapViewThree,
    required this.onTapViewTwo,
    required this.onTapViewOne,
  });

  @override
  State<SortingBookListViewShowModal> createState() =>
      _SortingBookListViewShowModalState();
}

class _SortingBookListViewShowModalState
    extends State<SortingBookListViewShowModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            widget.heading,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          margin: EdgeInsets.only(
            left: 30,
            top: 20,
          ),
        ),
        SizedBox(height: 20),
        LineSeparatorView(),
        SizedBox(height: 30),
        SortingBookListByView(
          valueOne: widget.valueOne,
          valueTwo: widget.valueTwo,
          valueThree: widget.valueThree,
          groupValue: widget.groupValue,
          textOne: widget.textOne,
          textTwo: widget.textTwo,
          textThree: widget.textThree,
          onTapViewOne: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onTapViewOne(widget.groupValue);
            });
          },
          onTapViewTwo: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onTapViewTwo(widget.groupValue);
            });
          },
          onTapViewThree: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onTapViewThree(widget.groupValue);
            });
          },
        ),
      ],
    );
  }
}

class SortingBookListByView extends StatefulWidget {
  String textOne;
  String textTwo;
  String textThree;
  int? valueOne;
  int? valueTwo;
  int? valueThree;
  Function(int?) onTapViewOne;
  Function(int?) onTapViewTwo;
  Function(int?) onTapViewThree;

  int? groupValue;
  SortingBookListByView({
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.onTapViewOne,
    required this.onTapViewTwo,
    required this.onTapViewThree,
    this.groupValue = 0,
    required this.valueThree,
    required this.valueTwo,
    required this.valueOne,
  });
  @override
  State<SortingBookListByView> createState() => _SortingBookListByViewState();
}

class _SortingBookListByViewState extends State<SortingBookListByView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                value: widget.valueOne,
                groupValue: widget.groupValue,
                onChanged: (clickValue) {
                  widget.onTapViewOne(clickValue);
                }),
            Text(
              widget.textOne,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                value: widget.valueTwo,
                groupValue: widget.groupValue,
                onChanged: (clickValue) {
                  widget.onTapViewTwo(clickValue);
                }),
            Text(
              widget.textTwo,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio(
                value: widget.valueThree,
                groupValue: widget.groupValue,
                onChanged: (clickValue) {
                  widget.onTapViewThree(clickValue);
                }),
            Text(
              widget.textThree,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
      ],
    );
  }
}

class MultiSelectTabBarViewSection extends StatefulWidget {
  List<String?>? tabList;
  Function(String) onTab;
  Function onTapCrossButton;
  String? chosenTab;
  bool? crossButtonVisible;
  bool? chosenTabVisible;
  bool? tabListVisible;
  MultiSelectTabBarViewSection({
    required this.tabList,
    required this.onTab,
    required this.onTapCrossButton,
    required this.chosenTab,
    required this.chosenTabVisible,
    required this.crossButtonVisible,
    this.tabListVisible = true,
  });
  @override
  State<MultiSelectTabBarViewSection> createState() =>
      _MultiSelectTabBarViewSectionState();
}

class _MultiSelectTabBarViewSectionState
    extends State<MultiSelectTabBarViewSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(right: 26, left: 26),
        scrollDirection: Axis.horizontal,
        children: [
          Visibility(
            visible: widget.crossButtonVisible ?? false,
            child: RemoveChosenTabIconView(onTapCrossButton: () {
              widget.onTapCrossButton();
            }),
          ),
          SizedBox(width: 10),
          Visibility(
              visible: widget.chosenTabVisible ?? false,
              child: ChosenTabWithColorView(text: "${widget.chosenTab}")),
          SizedBox(width: 10),
          Visibility(
            visible: (widget.tabList!.isNotEmpty),
            child: MultiTabsImplementForBookListView(
              tabList: widget.tabList ?? [],
              onTab: (tab) {
                widget.onTab(tab);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChosenTabWithColorView extends StatelessWidget {
  String text;
  ChosenTabWithColorView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class RemoveChosenTabIconView extends StatelessWidget {
  Function onTapCrossButton;
  RemoveChosenTabIconView({required this.onTapCrossButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCrossButton();
      },
      child: Container(
        child: Icon(
          Icons.highlight_off_outlined,
          size: 36,
          color: Colors.black45,
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: Colors.blue,
        ),
        //padding: EdgeInsets.all(3),
      ),
    );
  }
}

class MultiTabsImplementForBookListView extends StatelessWidget {
  MultiTabsImplementForBookListView({
    required this.tabList,
    required this.onTab,
  });
  List<String?>? tabList;
  Function(String) onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 34,
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 1,
            color: Colors.black12,
          )),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10, top: 0, right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: tabList?.length ?? 0,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: ((context, index) {
          return Text(
            "|",
            style: TextStyle(fontSize: 16),
          );
        }),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "${tabList?[index]}",
              ),
            ),
            onTap: () {
              onTab(tabList?[index] ?? "");
            },
          );
        },
      ),
    );
  }
}
