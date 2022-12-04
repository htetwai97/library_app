// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeVOAdapter extends TypeAdapter<VolumeVO> {
  @override
  final int typeId = 18;

  @override
  VolumeVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeVO(
      fields[0] as String?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<String?>(),
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      (fields[6] as List?)?.cast<IndustryIdentifierVO?>(),
      fields[7] as ReadingModeVO?,
      fields[8] as int?,
      fields[9] as String?,
      (fields[10] as List?)?.cast<String?>(),
      fields[11] as String?,
      fields[12] as bool?,
      fields[13] as String?,
      fields[14] as PaneLiZationVO?,
      fields[15] as ImageLinkVO?,
      fields[16] as String?,
      fields[17] as String?,
      fields[18] as String?,
      fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeVO obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.publisher)
      ..writeByte(4)
      ..write(obj.publishedDate)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.industryIdentifiers)
      ..writeByte(7)
      ..write(obj.readingMode)
      ..writeByte(8)
      ..write(obj.pageCount)
      ..writeByte(9)
      ..write(obj.printType)
      ..writeByte(10)
      ..write(obj.categories)
      ..writeByte(11)
      ..write(obj.maturityRating)
      ..writeByte(12)
      ..write(obj.allowAnonLogging)
      ..writeByte(13)
      ..write(obj.contentVersion)
      ..writeByte(14)
      ..write(obj.penalizationSummary)
      ..writeByte(15)
      ..write(obj.imageLinks)
      ..writeByte(16)
      ..write(obj.language)
      ..writeByte(17)
      ..write(obj.previewLink)
      ..writeByte(18)
      ..write(obj.infoLink)
      ..writeByte(19)
      ..write(obj.canonicalVolumeLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VolumeVO _$VolumeVOFromJson(Map<String, dynamic> json) => VolumeVO(
      json['title'] as String?,
      json['subtitle'] as String?,
      (json['authors'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['publisher'] as String?,
      json['publishedDate'] as String?,
      json['description'] as String?,
      (json['industryIdentifiers'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : IndustryIdentifierVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['readingModes'] == null
          ? null
          : ReadingModeVO.fromJson(
              json['readingModes'] as Map<String, dynamic>),
      json['pageCount'] as int?,
      json['printType'] as String?,
      (json['categories'] as List<dynamic>?)?.map((e) => e as String?).toList(),
      json['maturityRating'] as String?,
      json['allowAnonLogging'] as bool?,
      json['contentVersion'] as String?,
      json['panelizationSummary'] == null
          ? null
          : PaneLiZationVO.fromJson(
              json['panelizationSummary'] as Map<String, dynamic>),
      json['imageLinks'] == null
          ? null
          : ImageLinkVO.fromJson(json['imageLinks'] as Map<String, dynamic>),
      json['language'] as String?,
      json['previewLink'] as String?,
      json['infoLink'] as String?,
      json['canonicalVolumeLink'] as String?,
    );

Map<String, dynamic> _$VolumeVOToJson(VolumeVO instance) => <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subTitle,
      'authors': instance.authors,
      'publisher': instance.publisher,
      'publishedDate': instance.publishedDate,
      'description': instance.description,
      'industryIdentifiers': instance.industryIdentifiers,
      'readingModes': instance.readingMode,
      'pageCount': instance.pageCount,
      'printType': instance.printType,
      'categories': instance.categories,
      'maturityRating': instance.maturityRating,
      'allowAnonLogging': instance.allowAnonLogging,
      'contentVersion': instance.contentVersion,
      'panelizationSummary': instance.penalizationSummary,
      'imageLinks': instance.imageLinks,
      'language': instance.language,
      'previewLink': instance.previewLink,
      'infoLink': instance.infoLink,
      'canonicalVolumeLink': instance.canonicalVolumeLink,
    };
