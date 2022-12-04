import 'package:google_ebook_app/data/vos/buy_links_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_BOOK_VO, adapterName: "BookVOAdapter")
class BookVO {
  @HiveField(25)
  String? listName = "";

  @HiveField(26)
  String? saveDate = "";

  @HiveField(27)
  bool? isAddToShelve = false;

  @HiveField(28)
  bool? isAddToLibrary = false;

  @JsonKey(name: "age_group")
  @HiveField(0)
  String? ageGroup = "";

  @JsonKey(name: "amazon_product_url")
  @HiveField(1)
  String? amazonProductUrl = "";

  @JsonKey(name: "article_chapter_link")
  @HiveField(2)
  String? articleChapterLink = "";

  @JsonKey(name: "author")
  @HiveField(3)
  String? authorName = "";

  @JsonKey(name: "book_image")
  @HiveField(4)
  String? bookImage = "";

  /// ma ok yin int pYan pYgg
  @JsonKey(name: "book_image_width")
  @HiveField(5)
  double? bookImageWidth = 0.0;

  @JsonKey(name: "book_image_height")
  @HiveField(6)
  double? bookImageHeight = 0.0;

  @JsonKey(name: "book_review_link")
  @HiveField(7)
  String? bookReviewLink = "";

  @JsonKey(name: "contributor")
  @HiveField(8)
  String? contributor = "";

  @JsonKey(name: "contributor_note")
  @HiveField(9)
  String? contributorNote = "";

  @JsonKey(name: "created_date")
  @HiveField(10)
  String? createdDate = "";

  @JsonKey(name: "description")
  @HiveField(11)
  String? description = "";

  @JsonKey(name: "first_chapter_link")
  @HiveField(12)
  String? firstChapterLink = "";

  @JsonKey(name: "price")
  @HiveField(13)
  String? price = "";

  @JsonKey(name: "primary_isbn10")
  @HiveField(14)
  String? primaryIsbn10 = "";

  @JsonKey(name: "primary_isbn13")
  @HiveField(15)
  String? primaryIsbn13 = "";

  @JsonKey(name: "book_uri")
  @HiveField(16)
  String? bookUri = "";

  @JsonKey(name: "publisher")
  @HiveField(17)
  String? publisher = "";

  @JsonKey(name: "rank")
  @HiveField(18)
  double? rank = 0;

  @JsonKey(name: "rank_last_week")
  @HiveField(19)
  double? rankLastWeek = 0;

  @JsonKey(name: "sunday_review_link")
  @HiveField(20)
  String? sundayReviewLink = "";

  @JsonKey(name: "title")
  @HiveField(21)
  String? title = "";

  @JsonKey(name: "updated_date")
  @HiveField(22)
  String? updateDate = "";

  @JsonKey(name: "weeks_on_list")
  @HiveField(23)
  double? weeksOnList = 0;

  @JsonKey(name: "buy_links")
  @HiveField(24)
  List<BuyLinksVO?>? buyLinks = [];

  BookVO({
    this.listName,
    this.saveDate,
    this.ageGroup,
    this.amazonProductUrl,
    this.articleChapterLink,
    this.authorName,
    this.bookImage,
    this.bookImageWidth,
    this.bookImageHeight,
    this.bookReviewLink,
    this.contributor,
    this.contributorNote,
    this.createdDate,
    this.description,
    this.firstChapterLink,
    this.price,
    this.primaryIsbn10,
    this.primaryIsbn13,
    this.bookUri,
    this.publisher,
    this.rank,
    this.rankLastWeek,
    this.sundayReviewLink,
    this.title,
    this.updateDate,
    this.weeksOnList,
    this.buyLinks,
    this.isAddToShelve,
  });

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);
  Map<String, dynamic> toJson() => _$BookVOToJson(this);

  @override
  String toString() {
    return 'BookVO{listName: $listName, saveDate: $saveDate, isAddToShelve: $isAddToShelve, ageGroup: $ageGroup, amazonProductUrl: $amazonProductUrl, articleChapterLink: $articleChapterLink, authorName: $authorName, bookImage: $bookImage, bookImageWidth: $bookImageWidth, bookImageHeight: $bookImageHeight, bookReviewLink: $bookReviewLink, contributor: $contributor, contributorNote: $contributorNote, createdDate: $createdDate, description: $description, firstChapterLink: $firstChapterLink, price: $price, primaryIsbn10: $primaryIsbn10, primaryIsbn13: $primaryIsbn13, bookUri: $bookUri, publisher: $publisher, rank: $rank, rankLastWeek: $rankLastWeek, sundayReviewLink: $sundayReviewLink, title: $title, updateDate: $updateDate, weeksOnList: $weeksOnList, buyLinks: $buyLinks}';
  }
}
