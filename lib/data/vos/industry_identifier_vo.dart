import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'industry_identifier_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_INDUSTRY_LINK_VO,
    adapterName: "IndustryIdentifierVOAdapter")
class IndustryIdentifierVO {
  @JsonKey(name: "type")
  @HiveField(0)
  String? type;
  @JsonKey(name: "identifier")
  @HiveField(1)
  String? identifier;

  IndustryIdentifierVO(this.type, this.identifier);

  @override
  String toString() {
    return 'IndustryIdentifierVO{type: $type, identifier: $identifier}';
  }

  factory IndustryIdentifierVO.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifierVOFromJson(json);
  Map<String, dynamic> toJson() => _$IndustryIdentifierVOToJson(this);
}
