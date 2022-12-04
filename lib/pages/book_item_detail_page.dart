import 'package:flutter/material.dart';
import 'package:google_ebook_app/constants/string_constants.dart';
import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/pages/aboutBookPage.dart';
import 'package:google_ebook_app/pages/home_page.dart';
import 'package:google_ebook_app/pages/rating_review_page.dart';
import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';

class BookDetailPage extends StatelessWidget {
  BookVO? bookVO;
  BookDetailPage({this.bookVO});
  List<int> sampleApiList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height / 10,
        ),
        child: BookItemDetailAppBarView(),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BookAuthorImageForBottomSheet(
                onPressedIcon: (book){},
                book: bookVO,
                visibleDownLoadAndSeeMore: false,
              ),
            ),
            SizedBox(height: 20),
            LineSeparatorView(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ButtonsForWhatToDoWithBookView(),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InfoForBookBuyersOnWebView(),
            ),
            SizedBox(height: 20),
            LineSeparatorView(),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ReusableTextAndArrowView(
                title: "About this ebook",
                onTapArrow: (bookSection) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AboutBookPage(title: bookVO?.title, book: bookVO),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                /// new api
                ABOUT_BOOK_INTRO_TITLE,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ReusableTextAndArrowView(
                title: "Ratings And Reviews",
                onTapArrow: (title) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RatingAndReviewPage(
                        title: "Ratings And Reviews",
                        sampleApiList: sampleApiList,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RatingAndReviewsSectionView(),
            ),
            SizedBox(height: 26),
            CommentListsView(
              sampleApiList: sampleApiList,
              isFullList: false,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: PublishedSectionView(
                publish: "Published",
                aboutPublish: "December 1,2007. Revenue Road + Ohio/Alaska",
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CommentListsView extends StatelessWidget {
  List<int> sampleApiList;
  bool? isFullList;
  CommentListsView({required this.sampleApiList, this.isFullList = true});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: (isFullList ?? false)
          ? sampleApiList.length
          : sampleApiList.take(3).length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemExtent: 180,
      itemBuilder: (context, index) {
        return CommentSectionView(
          userImage:
              "https://images.saymedia-content.com/.image/t_share/MTc0NDI5MTc5NzI1NDg5Nzk4/top-10-greatest-leonardo-dicaprio-movies.jpg",
          userName: "Steven Gomez",
          commitDate: "11/16/22",
          comment: ABOUT_BOOK_INTRO_TITLE,
          rating: 5,
        );
      },
    );
  }
}

class RatingAndReviewsSectionView extends StatelessWidget {
  const RatingAndReviewsSectionView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AverageRatingAndTotalRatingCount(
          averageRating: "3.9",
          totalRatingCount: "95 ratings",
          ratingStar: 4,
        ),
        SizedBox(width: 16),
        AllRatingBarsView(),
      ],
    );
  }
}

class AverageRatingAndTotalRatingCount extends StatelessWidget {
  String averageRating;
  String totalRatingCount;
  double? ratingStar;
  AverageRatingAndTotalRatingCount({
    required this.averageRating,
    required this.totalRatingCount,
    this.ratingStar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          averageRating,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 46,
          ),
        ),
        RatingBarView(rating: ratingStar),
        SizedBox(height: 6),
        Text(
          totalRatingCount,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class AllRatingBarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleBarForEachRatingView(digit: "5", width: 100),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "4", width: 58),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "3", width: 42),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "2", width: 38),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "1", width: 13),
      ],
    );
  }
}

class SingleBarForEachRatingView extends StatelessWidget {
  String digit;
  double? width;
  SingleBarForEachRatingView({required this.width, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          digit,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 12),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              height: 8,
              width: 180,
            ),
            Positioned(
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                height: 8,
                width: width,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PublishedSectionView extends StatelessWidget {
  String? publish;
  String? aboutPublish;
  PublishedSectionView({required this.aboutPublish, required this.publish});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReusableTextAndArrowView(
          visibleArrow: false,
          title: publish,
          onTapArrow: (title) {},
        ),
        SizedBox(height: 10),
        Text(
          aboutPublish ?? "",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}

class CommentSectionView extends StatelessWidget {
  String? userImage;
  String? userName;
  double? rating;
  String? commitDate;
  String? comment;
  CommentSectionView(
      {required this.userImage,
      required this.userName,
      this.rating = 0,
      this.commitDate = "",
      required this.comment});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(
            "${userImage}",
          ),
          radius: 22,
        ),
        SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${userName}",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  RatingBarView(
                    rating: rating,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${commitDate}",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "${comment}",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class InfoForBookBuyersOnWebView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.info_outline,
          size: 18,
          color: Colors.black54,
        ),
        SizedBox(width: 18),
        Expanded(
          child: Text(
            "Books that you buy on the google play website can be read in this app",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class ButtonsForWhatToDoWithBookView extends StatefulWidget {
  @override
  State<ButtonsForWhatToDoWithBookView> createState() =>
      _ButtonsForWhatToDoWithBookViewState();
}

class _ButtonsForWhatToDoWithBookViewState
    extends State<ButtonsForWhatToDoWithBookView> {
  bool isClickedFreeSample = false;
  bool isClickedAddToWishList = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
                (isClickedFreeSample) ? Colors.white : Colors.blue),
            backgroundColor: MaterialStateProperty.all(
                (isClickedFreeSample) ? Colors.blue : Colors.white),
            textStyle: MaterialStateProperty.all(
              TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          onPressed: () {
            setState(() {
              isClickedFreeSample = true;
              isClickedAddToWishList = false;
            });
          },
          child: Text("Free Sample"),
        ),
        Spacer(),
        OutlinedButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(
                (isClickedAddToWishList) ? Colors.white : Colors.blue),
            backgroundColor: MaterialStateProperty.all(
                (isClickedAddToWishList) ? Colors.blue : Colors.white),
          ),
          onPressed: () {
            setState(() {
              isClickedAddToWishList = true;
              isClickedFreeSample = false;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.bookmark_add_outlined,
                  size: 16,
                ),
                SizedBox(width: 8),
                Text(
                  "Add to wishlist",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BookItemDetailAppBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20),
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
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.output,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
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
    );
  }
}
