import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'review_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_REVIEWS_VO, adapterName: "ReviewVOAdapter")
class ReviewVO {
  @JsonKey(name: "book_review_link")
  @HiveField(0)
  String? bookReviewLink;

  @JsonKey(name: "first_chapter_link")
  @HiveField(1)
  String? firstChapterLink;

  @JsonKey(name: "sunday_review_link")
  @HiveField(2)
  String? sundayReviewLink;

  @JsonKey(name: "article_chapter_link")
  @HiveField(3)
  String? articleChapterLink;

  ReviewVO(this.bookReviewLink, this.firstChapterLink, this.sundayReviewLink,
      this.articleChapterLink);

  factory ReviewVO.fromJson(Map<String, dynamic> json) =>
      _$ReviewVOFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewVOToJson(this);
}
