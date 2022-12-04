// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'epub_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpubVOAdapter extends TypeAdapter<EpubVO> {
  @override
  final int typeId = 10;

  @override
  EpubVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EpubVO(
      fields[0] as bool?,
      fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EpubVO obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.isAvailable)
      ..writeByte(1)
      ..write(obj.downloadLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpubVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpubVO _$EpubVOFromJson(Map<String, dynamic> json) => EpubVO(
      json['isAvailable'] as bool?,
      json['downloadLink'] as String?,
    );

Map<String, dynamic> _$EpubVOToJson(EpubVO instance) => <String, dynamic>{
      'isAvailable': instance.isAvailable,
      'downloadLink': instance.downloadLink,
    };
