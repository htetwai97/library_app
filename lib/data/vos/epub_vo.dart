import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'epub_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_EPUB_VO, adapterName: "EpubVOAdapter")
class EpubVO {
  @JsonKey(name: "isAvailable")
  @HiveField(0)
  bool? isAvailable;

  @JsonKey(name: "downloadLink")
  @HiveField(1)
  String? downloadLink;

  EpubVO(this.isAvailable, this.downloadLink);

  @override
  String toString() {
    return 'EpubVO{isAvailable: $isAvailable, downloadLink: $downloadLink}';
  }

  factory EpubVO.fromJson(Map<String, dynamic> json) => _$EpubVOFromJson(json);
  Map<String, dynamic> toJson() => _$EpubVOToJson(this);
}
