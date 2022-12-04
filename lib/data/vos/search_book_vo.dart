import 'package:google_ebook_app/data/vos/book_vo.dart';
import 'package:google_ebook_app/data/vos/volume_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_book_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_SEARCH_BOOK_VO, adapterName: "SearchBookVOAdapter")
class SearchBookVO {
  @JsonKey(name: "kind")
  @HiveField(0)
  String? kind;

  @JsonKey(name: "id")
  @HiveField(1)
  String? id;

  @JsonKey(name: "etag")
  @HiveField(2)
  String? eTag;

  @JsonKey(name: "selfLink")
  @HiveField(3)
  String? selfLink;

  @JsonKey(name: "volumeInfo")
  @HiveField(4)
  VolumeVO? volumeInfo;

  SearchBookVO(
    this.kind,
    this.id,
    this.eTag,
    this.selfLink,
    this.volumeInfo,
  );

  BookVO? changeToBookVO(SearchBookVO? searchBook, String? listName) {
    var book = BookVO();
    book.title = searchBook?.volumeInfo?.title;
    book.listName = listName;
    book.description = searchBook?.volumeInfo?.description;
    book.bookImage = searchBook?.volumeInfo?.imageLinks?.thumbNail;
    book.authorName = searchBook?.volumeInfo?.authors?.join(",");
    return book;
  }

  @override
  String toString() {
    return 'SearchBookVO{kind: $kind, id: $id, eTag: $eTag, selfLink: $selfLink, volumeInfo: $volumeInfo}';
  }

  factory SearchBookVO.fromJson(Map<String, dynamic> json) =>
      _$SearchBookVOFromJson(json);
  Map<String, dynamic> toJson() => _$SearchBookVOToJson(this);
}
