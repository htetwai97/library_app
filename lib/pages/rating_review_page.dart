import 'package:flutter/material.dart';
import 'package:google_ebook_app/pages/book_item_detail_page.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';

class RatingAndReviewPage extends StatelessWidget {
  String? title;
  List<int> sampleApiList;
  RatingAndReviewPage({this.title, required this.sampleApiList});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 10,
        ),
        child: AppBarView(title: title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RatingAndReviewsSectionView(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  StarsForRatingBox("1"),
                  Spacer(),
                  StarsForRatingBox("2"),
                  Spacer(),
                  StarsForRatingBox("3"),
                  Spacer(),
                  StarsForRatingBox("4"),
                  Spacer(),
                  StarsForRatingBox("5"),
                ],
              ),
            ),
            SizedBox(height: 20),
            CommentListsView(sampleApiList: sampleApiList)
          ],
        ),
      ),
    );
  }
}

class StarsForRatingBox extends StatelessWidget {
  String digit;
  StarsForRatingBox(this.digit);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      width: 56,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(18),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text(
              digit,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Spacer(),
            Icon(
              Icons.star,
              size: 18,
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }
}
