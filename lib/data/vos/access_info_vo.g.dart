// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_info_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessInfoVOAdapter extends TypeAdapter<AccessInfoVO> {
  @override
  final int typeId = 9;

  @override
  AccessInfoVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessInfoVO(
      fields[0] as String?,
      fields[1] as String?,
      fields[2] as bool?,
      fields[3] as bool?,
      fields[4] as String?,
      fields[5] as EpubVO?,
      fields[6] as PdfVO?,
      fields[7] as String?,
      fields[8] as String?,
      fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AccessInfoVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.viewAbility)
      ..writeByte(2)
      ..write(obj.embeddable)
      ..writeByte(3)
      ..write(obj.publicDomain)
      ..writeByte(4)
      ..write(obj.textToSpeechPermission)
      ..writeByte(5)
      ..write(obj.epub)
      ..writeByte(6)
      ..write(obj.pdf)
      ..writeByte(7)
      ..write(obj.webReaderLink)
      ..writeByte(8)
      ..write(obj.accessViewStatus)
      ..writeByte(9)
      ..write(obj.quoteSharingAllowed);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessInfoVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessInfoVO _$AccessInfoVOFromJson(Map<String, dynamic> json) => AccessInfoVO(
      json['country'] as String?,
      json['viewability'] as String?,
      json['embeddable'] as bool?,
      json['publicDomain'] as bool?,
      json['textToSpeechPermission'] as String?,
      json['epub'] == null
          ? null
          : EpubVO.fromJson(json['epub'] as Map<String, dynamic>),
      json['pdf'] == null
          ? null
          : PdfVO.fromJson(json['pdf'] as Map<String, dynamic>),
      json['webReaderLink'] as String?,
      json['accessViewStatus'] as String?,
      json['quoteSharingAllowed'] as bool?,
    );

Map<String, dynamic> _$AccessInfoVOToJson(AccessInfoVO instance) =>
    <String, dynamic>{
      'country': instance.country,
      'viewability': instance.viewAbility,
      'embeddable': instance.embeddable,
      'publicDomain': instance.publicDomain,
      'textToSpeechPermission': instance.textToSpeechPermission,
      'epub': instance.epub,
      'pdf': instance.pdf,
      'webReaderLink': instance.webReaderLink,
      'accessViewStatus': instance.accessViewStatus,
      'quoteSharingAllowed': instance.quoteSharingAllowed,
    };
