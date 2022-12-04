import 'package:flutter/material.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';

class AboutBookPage extends StatelessWidget {
  String? title;
  BookVO? book;
  AboutBookPage({this.title, this.book});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: AppBarView(title: "${title?.substring(0, 5)} ${book?.title}"),
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 10,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                ABOUT_BOOK_INTRO_TITLE,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26),
              child: Text(
                "${ABOUT_BOOK_DETAIL_PASSAGE}${ABOUT_BOOK_DETAIL_PASSAGE}",
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
