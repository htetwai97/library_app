import 'package:google_ebook_app/data/vos/image_link_vo.dart';
import 'package:google_ebook_app/data/vos/industry_identifier_vo.dart';
import 'package:google_ebook_app/data/vos/panelization_vo.dart';
import 'package:google_ebook_app/data/vos/reading_mode_vo.dart';
import 'package:google_ebook_app/persistance/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'volume_vo.g.dart';
@JsonSerializable()
@HiveType(typeId: HIVE_TYPE_ID_VOLUME_VO,adapterName: "VolumeVOAdapter")
class VolumeVO{
  @JsonKey(name: "title")
  @HiveField(0)
  String? title;

  @JsonKey(name: "subtitle")
  @HiveField(1)
  String? subTitle;

  @JsonKey(name: "authors")
  @HiveField(2)
  List<String?>? authors;

  @JsonKey(name: "publisher")
  @HiveField(3)
  String? publisher;

  @JsonKey(name: "publishedDate")
  @HiveField(4)
  String? publishedDate;

  @JsonKey(name: "description")
  @HiveField(5)
  String? description;

  @JsonKey(name: "industryIdentifiers")
  @HiveField(6)
  List<IndustryIdentifierVO?>? industryIdentifiers;

  @JsonKey(name: "readingModes")
  @HiveField(7)
  ReadingModeVO? readingMode;

  @JsonKey(name: "pageCount")
  @HiveField(8)
  int? pageCount;

  @JsonKey(name: "printType")
  @HiveField(9)
  String? printType;

  @JsonKey(name: "categories")
  @HiveField(10)
  List<String?>? categories;

  @JsonKey(name: "maturityRating")
  @HiveField(11)
  String? maturityRating;

  @JsonKey(name: "allowAnonLogging")
  @HiveField(12)
  bool? allowAnonLogging;

  @JsonKey(name: "contentVersion")
  @HiveField(13)
  String? contentVersion;

  @JsonKey(name: "panelizationSummary")
  @HiveField(14)
  PaneLiZationVO? penalizationSummary;

  @JsonKey(name: "imageLinks")
  @HiveField(15)
  ImageLinkVO? imageLinks;

  @JsonKey(name: "language")
  @HiveField(16)
  String? language;

  @JsonKey(name: "previewLink")
  @HiveField(17)
  String? previewLink;

  @JsonKey(name: "infoLink")
  @HiveField(18)
  String? infoLink;

  @JsonKey(name: "canonicalVolumeLink")
  @HiveField(19)
  String? canonicalVolumeLink;


  VolumeVO(
      this.title,
      this.subTitle,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.industryIdentifiers,
      this.readingMode,
      this.pageCount,
      this.printType,
      this.categories,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.penalizationSummary,
      this.imageLinks,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink);


  @override
  String toString() {
    return 'VolumeVO{title: $title, subTitle: $subTitle, authors: $authors, publisher: $publisher, publishedDate: $publishedDate, description: $description, industryIdentifiers: $industryIdentifiers, readingMode: $readingMode, pageCount: $pageCount, printType: $printType, categories: $categories, maturityRating: $maturityRating, allowAnonLogging: $allowAnonLogging, contentVersion: $contentVersion, penalizationSummary: $penalizationSummary, imageLinks: $imageLinks, language: $language, previewLink: $previewLink, infoLink: $infoLink, canonicalVolumeLink: $canonicalVolumeLink}';
  }

  factory VolumeVO.fromJson(Map<String, dynamic> json) =>
      _$VolumeVOFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeVOToJson(this);
}
