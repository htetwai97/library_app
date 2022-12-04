import 'package:flutter/material.dart';
import 'package:google_ebook_app/blocs/library_portions_bloc.dart';
import 'package:google_ebook_app/blocs/shelf_bloc.dart';
import 'package:google_ebook_app/controllers/shelf_controller.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class AddingIntoShelfPage extends StatefulWidget {
  BookVO? book;
  AddingIntoShelfPage({this.book});

  @override
  State<AddingIntoShelfPage> createState() => _AddingIntoShelfPageState();
}

class _AddingIntoShelfPageState extends State<AddingIntoShelfPage> {
  late ShelfBloc myBloc;
  @override
  void initState() {
    myBloc = ShelfBloc();
    super.initState();
  }

  @override
  void dispose() {
    myBloc.isDispose = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShelfBloc>.value(
      value: myBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Add to Shelves",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.highlight_remove_outlined,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Selector<ShelfBloc, List<ShelfVO?>?>(
          selector: (context, bloc) => bloc.shelfList,
          builder: (context, shelves, child) {
            return Selector<ShelfBloc, List<BookVO?>?>(
              selector: (context, bloc) => bloc.bookListForShelf,
              builder: (context, booksForShelf, child) {
                var bloc = Provider.of<ShelfBloc>(context, listen: false);
                BookVO? selectedBook = booksForShelf?.firstWhere(
                    (element) => element?.title == widget.book?.title);
                return CheckBoxOrArrowWithBookImageAndNameView(
                  bloc: bloc,
                  onTapArrow: (e) {},
                  visibleArrow: false,
                  visibleCheckBox: true,
                  book: selectedBook,
                  bookShelveList: shelves,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
