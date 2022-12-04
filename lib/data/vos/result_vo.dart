import 'package:google_ebook_app/data/vos/book_section_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'result_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_RESULT_VO, adapterName: "ResultVOAdapter")
class ResultVO {
  @JsonKey(name: "bestsellers_date")
  @HiveField(0)
  String? bestSellersDate;

  @JsonKey(name: "published_date")
  @HiveField(1)
  String? publishedDate;

  @JsonKey(name: "published_date_description")
  @HiveField(2)
  String? publishDateDescription;

  @JsonKey(name: "previous_published_date")
  @HiveField(3)
  String? previousPublishedDate;

  @JsonKey(name: "next_published_date")
  @HiveField(4)
  String? nextPublishedDate;

  @JsonKey(name: "lists")
  @HiveField(5)
  List<BookSectionVO?>? lists;

  factory ResultVO.fromJson(Map<String, dynamic> json) =>
      _$ResultVOFromJson(json);
  Map<String, dynamic> toJson() => _$ResultVOToJson(this);

  ResultVO(
      this.bestSellersDate,
      this.publishedDate,
      this.publishDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  @override
  String toString() {
    return 'ResultVO{bestSellersDate: $bestSellersDate, publishedDate: $publishedDate, publishDateDescription: $publishDateDescription, previousPublishedDate: $previousPublishedDate, nextPublishedDate: $nextPublishedDate, lists: $lists}';
  }
}
