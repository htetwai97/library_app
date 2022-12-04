import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'pdf_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_PDF_VO, adapterName: "PdfVOAdapter")
class PdfVO {
  @JsonKey(name: "isAvailable")
  @HiveField(0)
  bool? isAvailable;

  PdfVO(this.isAvailable);

  factory PdfVO.fromJson(Map<String, dynamic> json) => _$PdfVOFromJson(json);
  Map<String, dynamic> toJson() => _$PdfVOToJson(this);

  @override
  String toString() {
    return 'PdfVO{isAvailable: $isAvailable}';
  }
}
