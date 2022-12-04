// "readingModes": {
// "text": false,
// "image": true
// },

import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reading_mode_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_READING_MODE_VO,adapterName: "ReadingModeVOAdapter")
class ReadingModeVO{
  @JsonKey(name: "text")
  @HiveField(0)
  bool? text;

  @JsonKey(name: "image")
  @HiveField(1)
  bool? image;

  ReadingModeVO(this.text, this.image);

  @override
  String toString() {
    return 'ReadingModeVO{text: $text, image: $image}';
  }

  factory ReadingModeVO.fromJson(Map<String, dynamic> json) =>
      _$ReadingModeVOFromJson(json);
  Map<String, dynamic> toJson() => _$ReadingModeVOToJson(this);
}