import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'search_info_vo.g.dart';
@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_SEARCH_INFO_VO, adapterName: "SearchInfoVOAdapter")
class SearchInfoVO {
  @JsonKey(name: "textSnippet")
  @HiveField(0)
  String? textSnippet;

  SearchInfoVO(this.textSnippet);

  factory SearchInfoVO.fromJson(Map<String, dynamic> json) =>
      _$SearchInfoVOFromJson(json);
  Map<String, dynamic> toJson() => _$SearchInfoVOToJson(this);

  @override
  String toString() {
    return 'SearchInfoVO{textSnippet: $textSnippet}';
  }
}
