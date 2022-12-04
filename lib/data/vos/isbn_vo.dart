import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'isbn_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_ISBN_VO, adapterName: "IsbnVOAdapter")
class IsbnVO {
  @JsonKey(name: "isbn10")
  @HiveField(0)
  String? isbn10;

  @JsonKey(name: "isbn13")
  @HiveField(1)
  String? isbn13;

  IsbnVO(this.isbn10, this.isbn13);
  factory IsbnVO.fromJson(Map<String, dynamic> json) => _$IsbnVOFromJson(json);
  Map<String, dynamic> toJson() => _$IsbnVOToJson(this);

  @override
  String toString() {
    return 'IsbnVO{isbn10: $isbn10, isbn13: $isbn13}';
  }
}
