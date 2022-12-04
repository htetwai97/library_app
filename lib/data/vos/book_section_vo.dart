import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/isbn_vo.dart';
import 'package:google_ebook_app/data/vos/review_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_section_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_BOOK_SECTION_VO, adapterName: "BookSectionVOAdapter")
class BookSectionVO {
  @JsonKey(name: "list_id")
  @HiveField(0)
  int? listId;

  @JsonKey(name: "list_name")
  @HiveField(1)
  String? listName;

  @JsonKey(name: "list_name_encoded")
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: "display_name")
  @HiveField(3)
  String? displayName;

  @JsonKey(name: "updated")
  @HiveField(4)
  String? updated;

  @JsonKey(name: "list_image")
  @HiveField(5)
  String? listImage;

  @JsonKey(name: "list_image_width")
  @HiveField(6)
  int? listImageWidth;

  @JsonKey(name: "list_image_height")
  @HiveField(7)
  int? listImageHeight;

  @JsonKey(name: "books")
  @HiveField(8)
  List<BookVO?>? bookList;

  @JsonKey(name: "bestsellers_date")
  @HiveField(9)
  String? bestSellerDate;

  @JsonKey(name: "published_date")
  @HiveField(10)
  String? publishedDate;

  @JsonKey(name: "rank")
  @HiveField(11)
  int? rank;

  @JsonKey(name: "rank_last_week")
  @HiveField(12)
  int? rankLastWeek;

  @JsonKey(name: "weeks_on_list")
  @HiveField(13)
  int? weeksOnList;

  @JsonKey(name: "asterisk")
  @HiveField(14)
  int? asterisk;

  @JsonKey(name: "dagger")
  @HiveField(15)
  int? dagger;

  @JsonKey(name: "amazon_product_url")
  @HiveField(16)
  String? amazonProductUrl;

  @JsonKey(name: "isbns")
  @HiveField(17)
  List<IsbnVO?>? isBns;

  @JsonKey(name: "book_details")
  @HiveField(18)
  List<BookVO?>? bookDetails;

  @JsonKey(name: "reviews")
  @HiveField(19)
  List<ReviewVO?>? reviews;

  BookSectionVO(
      this.listId,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.bookList,
      this.bestSellerDate,
      this.publishedDate,
      this.rank,
      this.rankLastWeek,
      this.weeksOnList,
      this.asterisk,
      this.dagger,
      this.amazonProductUrl,
      this.isBns,
      this.bookDetails,
      this.reviews);

  factory BookSectionVO.fromJson(Map<String, dynamic> json) =>
      _$BookSectionVOFromJson(json);
  Map<String, dynamic> toJson() => _$BookSectionVOToJson(this);

  @override
  String toString() {
    return 'BookSectionVO{listId: $listId, listName: $listName, listNameEncoded: $listNameEncoded, displayName: $displayName, updated: $updated, listImage: $listImage, listImageWidth: $listImageWidth, listImageHeight: $listImageHeight, bookList: $bookList, bestSellerDate: $bestSellerDate, publishedDate: $publishedDate, rank: $rank, rankLastWeek: $rankLastWeek, weeksOnList: $weeksOnList, asterisk: $asterisk, dagger: $dagger, amazonProductUrl: $amazonProductUrl, isBns: $isBns, bookDetails: $bookDetails, reviews: $reviews}';
  }
}
