import 'package:flutter/material.dart';
import 'package:google_ebook_app/blocs/library_portions_bloc.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/controllers/shelf_controller.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/shelf_vo.dart';
import 'package:google_ebook_app/pages/book_shelves_detail_page.dart';
import 'package:google_ebook_app/pages/library_page.dart';
import 'package:google_ebook_app/reusable_widgets/already_created_bookshelves_list.dart';
import 'package:provider/provider.dart';


class CreateNewShelfPage extends StatefulWidget {

  @override
  State<CreateNewShelfPage> createState() => _CreateNewShelfPageState();
}

class _CreateNewShelfPageState extends State<CreateNewShelfPage> {
  TextEditingController textController = TextEditingController();
  late LibraryAndShelfPortionBloc myBloc;

  @override
  void initState() {
    myBloc = LibraryAndShelfPortionBloc();
    super.initState();
  }

  @override
  void dispose() {
    myBloc.isDispose = true;
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LibraryAndShelfPortionBloc>.value(
      value: myBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          title: Text(
            "Create Shelf",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 40,
          ),
          child: Selector<LibraryAndShelfPortionBloc, List<BookVO?>?>(
            selector: (context, bloc) => bloc.bookListForLibrary,
            builder: (context, books, widget) {
              return TextField(
                onSubmitted: (text) {
                  if (textController.text != "") {
                    List<BookVO?>? preBooksList = [];
                    ShelfVO shelf =
                        ShelfVO(preBooksList, textController.text, false);
                    ShelfController shelfController = ShelfController();
                    shelfController.catchAndSaveShelf(shelf);
                    var bloc = Provider.of<LibraryAndShelfPortionBloc>(context,
                        listen: false);
                    bloc.saveAllShelves(shelfController.shelfList);
                    Navigator.pop(context);
                  }
                },
                controller: textController,
                decoration: InputDecoration(
                  hintText: "Shelf name",
                  helperStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
    ;
  }
}
