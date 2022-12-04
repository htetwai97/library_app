import 'package:google_ebook_app/data/vos/epub_vo.dart';
import 'package:google_ebook_app/data/vos/pdf_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'access_info_vo.g.dart';

@JsonSerializable()
@HiveType(
    typeId: HIVE_TYPE_ID_ACCESS_INFO_VO, adapterName: "AccessInfoVOAdapter")
class AccessInfoVO {
  @JsonKey(name: "country")
  @HiveField(0)
  String? country;

  @JsonKey(name: "viewability")
  @HiveField(1)
  String? viewAbility;

  @JsonKey(name: "embeddable")
  @HiveField(2)
  bool? embeddable;

  @JsonKey(name: "publicDomain")
  @HiveField(3)
  bool? publicDomain;

  @JsonKey(name: "textToSpeechPermission")
  @HiveField(4)
  String? textToSpeechPermission;

  @JsonKey(name: "epub")
  @HiveField(5)
  EpubVO? epub;

  @JsonKey(name: "pdf")
  @HiveField(6)
  PdfVO? pdf;

  @JsonKey(name: "webReaderLink")
  @HiveField(7)
  String? webReaderLink;

  @JsonKey(name: "accessViewStatus")
  @HiveField(8)
  String? accessViewStatus;

  @JsonKey(name: "quoteSharingAllowed")
  @HiveField(9)
  bool? quoteSharingAllowed;

  AccessInfoVO(
      this.country,
      this.viewAbility,
      this.embeddable,
      this.publicDomain,
      this.textToSpeechPermission,
      this.epub,
      this.pdf,
      this.webReaderLink,
      this.accessViewStatus,
      this.quoteSharingAllowed);

  factory AccessInfoVO.fromJson(Map<String, dynamic> json) =>
      _$AccessInfoVOFromJson(json);
  Map<String, dynamic> toJson() => _$AccessInfoVOToJson(this);

  @override
  String toString() {
    return 'AccessInfoVO{country: $country, viewAbility: $viewAbility, embeddable: $embeddable, publicDomain: $publicDomain, textToSpeechPermission: $textToSpeechPermission, epub: $epub, pdf: $pdf, webReaderLink: $webReaderLink, accessViewStatus: $accessViewStatus, quoteSharingAllowed: $quoteSharingAllowed}';
  }
}
